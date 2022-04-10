// ############
// execute with:
// yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/update-existing-hikes.ts
import { YahaApi, getGraphqlSdkForIAM } from '../libs/gql-api/src';
import { getAllPaginatedDataForAmplify } from '../libs/shared/graphql/api-client/src';
import { forkJoin, from, map, mergeMap, of, switchMap, tap } from 'rxjs';
import {
  filterNullishElements,
  filterNullishGraphqlListWithDefault,
} from '../libs/shared/utils/src';
import {
  GoogleMapsDeps,
  googleReverseGeocodingService,
} from '../libs/backend/hike-search/services/src/lib/google-maps';
import { Client as GoogleMapsClient } from '@googlemaps/google-maps-services-js';

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || 'AWS_ACCESS_KEY_ID NOT DEFINED',
  process.env.AWS_SECRET_ACCESS_KEY || 'AWS_SECRET_ACCESS_KEY NOT DEFINED',
);

const googleMapsDeps: GoogleMapsDeps = {
  apiKey: process.env.GOOGLE_API_KEY || '',
  client: new GoogleMapsClient({}),
};

getAllPaginatedDataForAmplify(sdk.ListHikes, {})
  .pipe(
    filterNullishGraphqlListWithDefault<YahaApi.Hike | undefined | null>([]),
    filterNullishElements(),
    tap(x => console.warn(`Processing ${x.length} hikes...`)),
    //    map(x => [x[0]]),
    switchMap(x => from(x)),
    mergeMap(
      hike =>
        forkJoin([
          googleReverseGeocodingService(googleMapsDeps).getCity({
            lat: hike.route.coordinates[0][1],
            lon: hike.route.coordinates[0][0],
          }),
        ]).pipe(
          tap(x => console.warn('Updating with: ', x)),
          mergeMap(([city]) =>
            sdk.UpdateHike({ input: { id: hike.id, closestPlace: city } }),
          ),
        ),
      10,
    ),
  )
  .subscribe();
