import { pipe } from 'fp-ts/lib/function';
import { Neo4jdeps } from './utils';
import * as R from 'ramda';
import { of, defer, from, throwError } from 'rxjs';
import {
  map,
  retry,
  concatMap,
  switchMap,
  tap,
  takeWhile,
  count,
  catchError,
} from 'rxjs/operators';
import { tagImage } from '@yaha/backend/image-tagger';
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';

const poiQuery = `
match (i:Image {banned: false})-[:TAKEN_AT]->(p:Poi) 
with p, count(i) as cnt
where cnt < 11
match (i:Image)-[:TAKEN_AT]->(p) where i.processed is null
with p, cnt, count(i) as pcnt, i
where pcnt > 0
return i limit 1
`;

const hikeQuery = `
match (i:Image {banned: false})-[:TAKEN_AT]->(p:Hike) 
with p, count(i) as cnt
where cnt < 31
match (i:Image)-[:TAKEN_AT]->(p) where i.processed is null
with p, cnt, count(i) as pcnt, i
where pcnt > 0
return i limit 1
`;

export const tagUntaggedImagesOfEntity = (deps: Neo4jdeps) => (query: string) =>
  pipe(
    defer(() => deps.session.readTransaction(tx => tx.run(query))),
    map(result =>
      pipe(
        result.records,
        R.map(record => record.get(0).properties),
        R.map(props => ({
          url: props.card,
          id: props.id,
        })),
      ),
    ),
    switchMap(x => from(x)),
    concatMap(image => {
      return tagImage(image.url).pipe(
        OE.fold(
          () =>
            of({
              banned: true,
              labels: '',
            }),
          labels =>
            of({
              banned: false,
              labels: JSON.stringify(labels),
            }),
        ),
        tap(x => console.warn('Image updated with: ', x)),
        switchMap(newProps =>
          pipe(
            `
match (image:Image) where image.id = "${image.id}"
set image.banned = ${newProps.banned}
set image.labels = '${newProps.labels}' 
set image.processed = true
`,
            query =>
              defer(() => deps.session.writeTransaction(tx => tx.run(query))),
          ),
        ),
      );
    }),
    count(),
    tap(x => console.log(`Processed ${x} images`)),
    takeWhile(imgCount => imgCount > 0),
    switchMap(() => throwError('AGAIN')),
    retry(300),
    catchError(err => (err == 'AGAIN' ? of({}) : throwError(err))),
  );

export const tagUntaggedImages = (deps: Neo4jdeps) =>
  tagUntaggedImagesOfEntity(deps)(hikeQuery);
