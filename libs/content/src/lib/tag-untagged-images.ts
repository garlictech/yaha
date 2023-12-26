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
match (p:Poi) 
optional match (i:Image {banned: false})-[:TAKEN_AT]->(p:Poi) 
with p, count(i) as cnt_i
where cnt_i < 11
match (i:Image)-[:TAKEN_AT]->(p) where i.processed is null
with p, count(i) as pcnt, i
where pcnt > 0
return i limit 10
`;

const hikeQuery = `
match (r:Route) 
optional match (i:Image {banned: false})-[:TAKEN_AT]->(r)
with r, count(i) as cnt_i
where cnt_i < 31
match (i:Image)-[:TAKEN_AT]->(r) where i.processed is null
with r, count(i) as pcnt, i
where pcnt > 0
return i limit 31
`;

let cnt = 0;

export const tagUntaggedImagesOfEntity = (deps: Neo4jdeps) => (query: string) =>
  pipe(
    defer(() => deps.driver.executeQuery(query)),
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
    tap(x => console.log(`PROCESSING ${x.length} images...`)),
    switchMap(x => from(x)),
    concatMap(image => {
      console.log(`HANDLED ${cnt++} IMAGES`);
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
            query => defer(() => deps.driver.executeQuery(query)),
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
  tagUntaggedImagesOfEntity(deps)(poiQuery);
