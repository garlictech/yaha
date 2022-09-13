import { pipe } from 'fp-ts/lib/function';
import { Neo4jdeps } from './utils';
import * as R from 'ramda';
import { of, defer, from } from 'rxjs';
import { map, concatMap, switchMap, tap, count } from 'rxjs/operators';
import { tagImage } from '@yaha/backend/image-tagger';
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';

export const tagUntaggedImages = (deps: Neo4jdeps) =>
  pipe(
    `
match (image:Image) where image.processed is null
return image limit 1000 
`,
    query => defer(() => deps.session.readTransaction(tx => tx.run(query))),
    map(result =>
      pipe(
        result.records,
        R.map(record => record.get(0).properties),
        R.map(props => ({ url: props.card, id: props.id })),
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
  );
