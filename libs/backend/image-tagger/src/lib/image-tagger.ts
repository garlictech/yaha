import * as AWS from 'aws-sdk';
import { Rekognition } from 'aws-sdk';
import axios from 'axios';
import * as fp from 'lodash/fp';
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';
import * as TE from 'fp-ts/lib/TaskEither';
import * as E from 'fp-ts/lib/Either';
import { pipe, flow, Lazy } from 'fp-ts/lib/function';
import * as R from 'ramda';

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
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
): OE.ObservableEither<any, string[]> =>
  pipe(
    imageUrl,
    fp.tap(() => console.log(`Tagging image at ${imageUrl}`)),
    getBase64BufferFromURL,
    OE.chain(bytes =>
      pipe(
        isImageUnsafe(minConfidence)(bytes),
        OE.chain(() => isFaceInImage(minConfidence)(bytes)),
        OE.chain(() => isRelevantImage(maxLabels, minConfidence)(bytes)),
      ),
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
  ): OE.ObservableEither<any, string[]> =>
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
      OE.map(
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
        ),
      ),
      OE.map(labels =>
        R.isNil(labels)
          ? E.left(new Error('failed'))
          : E.right(labels as Rekognition.Labels),
      ),
      OE.chain(x => OE.fromEither(x)),
      OE.chain(
        flow(labels =>
          fp.some(
            (label: Rekognition.Label) =>
              !!label.Name &&
              !!label.Confidence &&
              ['Nature', 'Outdoors', 'Vegetation'].includes(label.Name) &&
              !['Human', 'Person'].includes(label.Name),
          )(labels)
            ? OE.right(
                pipe(
                  labels,
                  R.map(label => label.Name),
                  R.reject(x => R.isNil(x)),
                  x => x as string[],
                ),
              )
            : OE.left(new Error('failed')),
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
