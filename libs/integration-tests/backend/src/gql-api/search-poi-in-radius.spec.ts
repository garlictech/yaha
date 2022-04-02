import { getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { delay, forkJoin, switchMap, tap } from 'rxjs';
import * as R from 'ramda';

const poiId = '12-search-poi-in-radius-c86e6484-a2c7-11ec-b909-0242ac120002';

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || '',
  process.env.AWS_SECRET_ACCESS_KEY || '',
);

const cleanup$ = forkJoin([sdk.DeletePoi({ input: { id: poiId } })]);

afterAll(done => {
  cleanup$.subscribe(() => done());
});

test('Search for a poi in radius', done => {
  sdk
    .CreatePoi({
      input: {
        id: poiId,
        location: {
          lat: 1,
          lon: 1,
        },
      },
    })
    .pipe(
      delay(3000),
      switchMap(() =>
        sdk.SearchByRadius({
          query: {
            location: { lat: 1, lon: 1 },
            radiusInMeters: 100,
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
          },
        }),
      ),
      tap(console.warn),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot('SHOULD FIND poi'),
      ),
      switchMap(() =>
        sdk.SearchByRadius({
          query: {
            location: { lat: 2, lon: 2 },
            radiusInMeters: 100,
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
          },
        }),
      ),
      tap(console.warn),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot(
          'SHOULD NOT FIND poi',
        ),
      ),
    )
    .subscribe(() => done());
}, 10000);
