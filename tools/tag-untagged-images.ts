// ############
// execute with:
// yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/tag-untagged-images.ts
import * as OE from 'fp-ts-rxjs/lib/ObservableEither';
import { YahaApi, getGraphqlSdkForIAM } from '../libs/gql-api/src';
import { tagImage } from '../libs/backend/image-tagger/src';
import { getAllPaginatedDataForAmplify } from '../libs/shared/graphql/api-client/src';
import { from, map, mergeMap, of, switchMap, tap } from 'rxjs';
import {
  filterNullishElements,
  filterNullishGraphqlListWithDefault,
} from '../libs/shared/utils/src';

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || 'AWS_ACCESS_KEY_ID NOT DEFINED',
  process.env.AWS_SECRET_ACCESS_KEY || 'AWS_SECRET_ACCESS_KEY NOT DEFINED',
);

getAllPaginatedDataForAmplify(sdk.SearchImages, {
  query: {
    filter: {
      tagged: {
        ne: true,
      },
    },
  },
})
  .pipe(
    filterNullishGraphqlListWithDefault<YahaApi.Image | undefined | null>([]),
    filterNullishElements(),
    tap(x => console.warn(`Processing ${x.length} images...`)),
    //map(images => [images[0]]),
    switchMap(x => from(x)),
    mergeMap(image => {
      console.log('Tagging ', image.card.url);
      return tagImage(image.card.url).pipe(
        OE.fold(
          () =>
            of({
              banned: true,
              tagged: true,
            }),
          labels =>
            of({
              id: image.id,
              tagged: true,
              banned: false,
              labels,
            }),
        ),
        tap(x => console.warn('Image updated with: ', x)),
        switchMap(input =>
          sdk.UpdateImage({
            input: {
              id: image.id,
              ...input,
            },
          }),
        ),
      );
    }, 10),
  )
  .subscribe();
