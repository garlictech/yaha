import { ExternalPoi } from '@yaha/backend/hike-search/services';
import { YahaApi } from '@yaha/gql-api';
import {
  generateBackgroundForExternalPois,
  generateIconForExternalPois,
  generateImageForPoiTypes,
  getTypesWithNoImages,
  yahaAppPoiBackgroundLocation,
  yahaAppPoiIconLocation,
  yahaPoiIconCreatorScriptLocation,
} from '../../process_poi_types';
import * as path from 'path';
import * as fs from 'fs';

describe('process_poi_typ', () => {
  const project_root = process.env.PROJECT_ROOT || '';
  const generatedType = 'brown_bear';

  const cleanUp = () => {
    const poiLocation = yahaAppPoiIconLocation(project_root);
    const imageLocation = yahaAppPoiBackgroundLocation(project_root);

    const bearIconLocation = path.join(poiLocation, `${generatedType}.svg`);

    const bearBackgroundLocation = path.join(
      imageLocation,
      `${generatedType}.svg`,
    );

    for (const file of [bearIconLocation, bearBackgroundLocation]) {
      if (fs.existsSync(file)) {
        fs.unlinkSync(file);
      }
    }
  };

  beforeEach(() => {
    cleanUp();
  });

  afterAll(() => {
    cleanUp();
  });

  const externalPois: ExternalPoi[] = [
    {
      externalId: '1',
      location: {
        lat: 0,
        lon: 0,
      },
      description: {
        languageKey: 'de',
        type: YahaApi.DescriptionType.html,
      },
      type: `tourism:${generatedType}`,
    },

    {
      externalId: '1',
      location: {
        lat: 0,
        lon: 0,
      },
      description: {
        languageKey: 'de',
        type: YahaApi.DescriptionType.html,
      },
      type: 'amenity:toilets',
    },
  ];

  it('getTypesWithNoIcons should retturn the types having no icon', () => {
    const imageFolder = yahaAppPoiIconLocation(project_root);

    const result = getTypesWithNoImages(imageFolder)(externalPois);

    expect(result).toMatchInlineSnapshot(`
      Array [
        "brown_bear",
      ]
    `);
  });

  it('generateIconForPoiTypes should generate an icon woth chatGPT for the passed types', () => {
    const tags = [generatedType];
    const scriptLocation = yahaPoiIconCreatorScriptLocation(project_root);

    const result = generateImageForPoiTypes(scriptLocation)(tags);

    expect(result).toMatchInlineSnapshot(`
      Array [
        "brown_bear",
      ]
    `);
  });

  it('generateIconForExternalPois should generate poi icon for external pois', () => {
    const result = generateIconForExternalPois(project_root)(externalPois);

    expect(result).toMatchInlineSnapshot(`
      Array [
        Object {
          "description": Object {
            "languageKey": "de",
            "type": "html",
          },
          "externalId": "1",
          "location": Object {
            "lat": 0,
            "lon": 0,
          },
          "type": "tourism:brown_bear",
        },
        Object {
          "description": Object {
            "languageKey": "de",
            "type": "html",
          },
          "externalId": "1",
          "location": Object {
            "lat": 0,
            "lon": 0,
          },
          "type": "amenity:toilets",
        },
      ]
    `);
  });

  it('generateBackgroundForExternalPois should generate poi background for external pois', () => {
    const result =
      generateBackgroundForExternalPois(project_root)(externalPois);

    expect(result).toMatchInlineSnapshot(`
      Array [
        Object {
          "description": Object {
            "languageKey": "de",
            "type": "html",
          },
          "externalId": "1",
          "location": Object {
            "lat": 0,
            "lon": 0,
          },
          "type": "tourism:brown_bear",
        },
        Object {
          "description": Object {
            "languageKey": "de",
            "type": "html",
          },
          "externalId": "1",
          "location": Object {
            "lat": 0,
            "lon": 0,
          },
          "type": "amenity:toilets",
        },
      ]
    `);
  });
});
