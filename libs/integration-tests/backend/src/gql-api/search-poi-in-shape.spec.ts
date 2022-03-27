import { getGraphqlSdkForIAM, YahaApi } from '@yaha/gql-api';
import { delay, forkJoin, switchMap, tap } from 'rxjs';
import * as R from 'ramda';

const poiId = '13-search-poi-in-radius-c86e6484-a2c7-11ec-b909-0242ac120002';

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
        sdk.SearchInEnvelope({
          query: {
            envelope: [
              [0, 2],
              [2, 0],
            ],
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
          },
        }),
      ),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot(
          'SHOULD FIND IN ENVELOPE',
        ),
      ),
      switchMap(() =>
        sdk.SearchInShape({
          query: {
            shape: {
              type: 'polygon',
              coordinates: [
                [
                  [0, 2],
                  [2, 2],
                  [2, 0],
                  [0, 0],
                  [0, 2],
                ],
              ],
            },
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
          },
        }),
      ),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot(
          'SHOULD FIND IN POLYGON',
        ),
      ),
      switchMap(() =>
        sdk.SearchInMultipolygon({
          query: {
            coordinates: [
              [
                [
                  [0, 2],
                  [2, 2],
                  [2, 0],
                  [0, 0],
                  [0, 2],
                ],
                [
                  [0, 0.5],
                  [0.5, 0.5],
                  [0.5, 0],
                  [0, 0],
                  [0, 0.5],
                ],
              ],
            ],
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
          },
        }),
      ),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot(
          'SHOULD FIND IN MULTIPOLYGON',
        ),
      ),
      switchMap(() =>
        sdk.SearchInEnvelope({
          query: {
            envelope: [
              [3, 4],
              [4, 3],
            ],
            objectType: YahaApi.GeoSearchableObjectType.poi,
            limit: 1,
          },
        }),
      ),
      tap(res =>
        expect(R.omit(['nextToken'], res)).toMatchSnapshot(
          'SHOULD NOT FIND poi',
        ),
      ),
    )
    .subscribe(() => done());
}, 10000);
