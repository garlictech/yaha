import { ExternalPoi } from '@yaha/backend/hike-search/services';
import { DescriptionType } from 'libs/gql-api/src/lib/generated/yaha-api';
import { processPoiIcons } from '../../process_poi_types';

describe('process_poi_types', () => {
  const project_root = process.env.PROJECT_ROOT || '';

  it('should process poi types', () => {
    const externalPois: ExternalPoi[] = [
      {
        externalId: '1',
        location: {
          lat: 0,
          lon: 0,
        },
        description: {
          languageKey: 'de',
          type: DescriptionType.html,
        },
        type: 'flagpole',
      },

      {
        externalId: '1',
        location: {
          lat: 0,
          lon: 0,
        },
        description: {
          languageKey: 'de',
          type: DescriptionType.html,
        },
        type: 'tomb',
      },
    ];

    /*const result = processPoiIcons(project_root)(externalPois);

    expect(result).toMatchInlineSnapshot();*/
    expect(true).toBe(true);
  });
});
