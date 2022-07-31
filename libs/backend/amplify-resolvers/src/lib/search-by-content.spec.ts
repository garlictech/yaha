import { YahaApi } from '@yaha/gql-api';
import { tap } from 'rxjs';
import { searchByContentResolver } from './search-resolvers';

test('Search in title', done => {
  const deps = {
    osClient: {
      search: jest.fn().mockReturnValue(
        Promise.resolve({
          body: {
            hits: {
              total: {
                value: 10,
              },
              hits: [
                {
                  _source: {
                    id: 'RETURNED_ID',
                  },
                  sort: [12345],
                },
              ],
            },
          },
        }),
      ),
    },
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  } as any;

  searchByContentResolver(deps)({
    query: {
      content: 'CONTENT',
      objectType: YahaApi.GeoSearchableObjectType.hike,
      limit: 3,
      nextToken: '[4]',
    },
  })
    .pipe(
      tap(res => {
        expect(res).toMatchSnapshot('RESULT');
        expect(deps.osClient.search.mock.calls).toMatchSnapshot('SEARCH CALLS');
      }),
    )

    .subscribe(() => done());
});

test('Default parameters', done => {
  const deps = {
    osClient: {
      search: jest.fn().mockReturnValue(
        Promise.resolve({
          body: {
            hits: {
              hits: [
                {
                  _source: {
                    id: 'RETURNED_ID',
                  },
                },
              ],
            },
          },
        }),
      ),
    },
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  } as any;

  searchByContentResolver(deps)({
    query: {
      content: 'CONTENT',
      objectType: YahaApi.GeoSearchableObjectType.hike,
    },
  })
    .pipe(
      tap(res => {
        expect(res).toMatchSnapshot('RESULT');
        expect(deps.osClient.search.mock.calls).toMatchSnapshot('SEARCH CALLS');
      }),
    )

    .subscribe(() => done());
});
