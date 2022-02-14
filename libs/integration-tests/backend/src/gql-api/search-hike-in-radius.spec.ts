import { getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { delay, forkJoin, switchMap, tap } from 'rxjs';
import * as R from 'ramda';

const hikeId = '12-search-hike-in-radius-c86e6484-a2c7-11ec-b909-0242ac120002';

const sdk = getGraphqlSdkForIAM(
  process.env.AWS_ACCESS_KEY_ID || '',
  process.env.AWS_SECRET_ACCESS_KEY || '',
);

const cleanup$ = forkJoin([sdk.DeleteHike({ input: { id: hikeId } })]);

afterAll(done => {
  cleanup$.subscribe(() => done());
});

test('Search for a hike in radius', done => {
  sdk
    .CreateHike({
      input: {
        id: hikeId,
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
          input: {
            location: { lat: 1, lon: 1 },
            radiusInMeters: 100,
            objectType: YahaApi.GeoSearchableObjectType.hike,
            limit: 1,
          },
        }),
      ),
      tap(console.warn),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot('SHOULD FIND HIKE'),
      ),
      switchMap(() =>
        sdk.SearchByRadius({
          input: {
            location: { lat: 2, lon: 2 },
            radiusInMeters: 100,
            objectType: YahaApi.GeoSearchableObjectType.hike,
            limit: 1,
          },
        }),
      ),
      tap(console.warn),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot(
          'SHOULD NOT FIND HIKE',
        ),
      ),
    )
    .subscribe(() => done());
}, 10000);
