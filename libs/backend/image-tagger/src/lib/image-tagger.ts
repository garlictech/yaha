import * as AWS from 'aws-sdk';
import { Rekognition } from 'aws-sdk';
import axios from 'axios';
import * as fp from 'lodash/fp';
import { Observable, of } from 'rxjs';
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';
import * as TE from 'fp-ts/lib/TaskEither';
import * as E from 'fp-ts/lib/Either';
import { pipe, flow, Lazy } from 'fp-ts/lib/function';
import { tap } from 'rxjs/operators';

const promiseToObservableEither = <A>(task: Lazy<Promise<A>>) =>
  pipe(TE.tryCatch(task, E.toError), OE.fromTaskEither);

AWS.config.update({
  accessKeyId: process.env.AWS_ACCESS_KEY_ID || '',
  secretAccessKey: process.env.AWS_SECRET_ACCESS_KEY || '',
  region: process.env.AWS_REGION || '',
});

const rekognition = new AWS.Rekognition({
  apiVersion: '2016-06-27',
});

const defaultMaxLabels = 10;
const defaultMinConfidence = 80;

export const tagImage = (
  imageUrl: string,
  maxLabels = defaultMaxLabels,
  minConfidence = defaultMinConfidence,
): Observable<boolean> =>
  pipe(
    imageUrl,
    fp.tap(() => console.log(`Tagging image at ${imageUrl}`)),
    getBase64BufferFromURL,
    OE.chain(bytes =>
      flow(
        isRelevantImage(maxLabels, minConfidence),
        OE.chain(() => isImageUnsafe(minConfidence)(bytes)),
        OE.chain(() => isFaceInImage(minConfidence)(bytes)),
      )(bytes),
    ),
    OE.fold(
      () => of(false),
      () => of(true),
    ),
    tap((isGood: boolean) =>
      console.log(`Image at ${imageUrl} is ${isGood ? 'GOOD' : 'BAD'}`),
    ),
  );

const getBase64BufferFromURL = (
  url: string,
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): OE.ObservableEither<any, Buffer> =>
  pipe(
    () =>
      axios.get(url, {
        responseType: 'arraybuffer',
      }),
    promiseToObservableEither,
    OE.map(response => Buffer.from(response.data, 'base64')),
  );

const isRelevantImage =
  (maxLabels: number, minConfidence: number) =>
  (
    bytes: Buffer,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  ): OE.ObservableEither<any, true> =>
    pipe(
      () =>
        rekognition
          .detectLabels({
            Image: {
              Bytes: bytes,
            },
            MaxLabels: maxLabels,
            MinConfidence: minConfidence,
          })
          .promise(),
      promiseToObservableEither,
      OE.chain(
        flow(
          (res: Rekognition.DetectLabelsResponse) => res.Labels,
          fp.tap(labels =>
            console.debug(
              `Found labels: ${JSON.stringify(
                fp.map('Name', labels),
                null,
                2,
              )}`,
            ),
          ),
          fp.some(
            res =>
              !!res.Name &&
              !!res.Confidence &&
              ['Nature', 'Outdoors', 'Vegetation'].includes(res.Name),
          ),
          fp.tap(isRelevant =>
            console.info(`--- detected relevance: ${isRelevant}`),
          ),
          isRelevant =>
            isRelevant ? OE.right(true) : OE.left(new Error('failed')),
        ),
      ),
    );

const isImageUnsafe =
  (minConfidence: number) =>
  (
    bytes: Buffer,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  ): OE.ObservableEither<any, boolean> =>
    pipe(
      () =>
        rekognition
          .detectModerationLabels({
            Image: {
              Bytes: bytes,
            },
            MinConfidence: minConfidence,
          })
          .promise(),
      promiseToObservableEither,
      OE.chain(
        flow(
          (res: Rekognition.DetectModerationLabelsResponse) =>
            res.ModerationLabels,
          fp.tap(reasons =>
            console.debug(
              `Found safety problems: ${JSON.stringify(
                fp.map('Name', reasons),
                null,
                2,
              )}`,
            ),
          ),
          fp.filter(res => !!res.Name && !!res.Confidence),
          fp.isEmpty,
          fp.tap(isOk => console.info(`--- detected safe image: ${isOk}`)),
          isOk => (isOk ? OE.right(true) : OE.left(new Error('Failed'))),
        ),
      ),
    );

const isFaceInImage =
  (minConfidence: number) =>
  (
    bytes: Buffer,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  ): OE.ObservableEither<any, true> =>
    pipe(
      () =>
        rekognition
          .detectFaces({
            Image: {
              Bytes: bytes,
            },
            Attributes: ['DEFAULT'],
          })
          .promise(),
      promiseToObservableEither,
      OE.chain(
        fp.flow(
          (res: Rekognition.DetectFacesResponse) => res.FaceDetails,
          fp.map((item: Rekognition.FaceDetail) => item.Confidence),
          fp.some((confidence: number) => confidence > minConfidence),
          fp.tap(isFaceFound =>
            console.info(`--- detected face in image: ${isFaceFound}`),
          ),
          isFaceFound =>
            isFaceFound ? OE.left(new Error('failed')) : OE.right(true),
        ),
      ),
    );
