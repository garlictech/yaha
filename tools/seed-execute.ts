// ############
// execute with:
// yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/seed-execute.ts

import '@aws-amplify/datastore';

import { DataStore, Amplify } from 'aws-amplify';
import {
  awsConfig,
  Poi,
  Hike,
  PoiSource,
  TextualDescriptionType,
} from '../libs/gql-api/src';

Amplify.configure(awsConfig);

(async function execute() {
  await DataStore.save(
    new Poi({
      location: { lat: 0, lon: 0 },
      description: [
        {
          languageKey: 'en_US',
          type: TextualDescriptionType.MARKDOWN,
          title: 'POI title',
        },
      ],
      sourceObject: [
        { objectType: PoiSource.OSM_AMENITY, objectId: 'OBJECTID' },
      ],
    }),
  );

  console.log('POI saved.');

  await DataStore.save(
    new Hike({
      location: 'Budapest',
      description: [
        {
          languageKey: 'hu_HU',
          type: TextualDescriptionType.MARKDOWN,
          title: 'Túra',
          summary: 'Túrázás, vár, erdő, és barlang',
        },
      ],
      imageUrls: ['https://loremflickr.com/g/320/240/landscape'],
    }),
  );

  console.log('Hike saved.');

  await DataStore.save(
    new Hike({
      location: 'Mátrafüred',
      description: [
        {
          languageKey: 'hu_HU',
          type: TextualDescriptionType.MARKDOWN,
          title: 'Mátra',
          summary: 'Mátra, erdős hegyek túrázáshoz',
        },
      ],
      imageUrls: ['https://loremflickr.com/g/320/240/landscape'],
    }),
  );

  console.log('Hike saved.');

  await DataStore.save(
    new Hike({
      location: 'Balaton',
      description: [
        {
          languageKey: 'hu_HU',
          type: TextualDescriptionType.MARKDOWN,
          title: 'Balaton',
          summary: 'Nagy édesvizű tó üdülővárosokkal',
        },
      ],
      imageUrls: ['https://loremflickr.com/g/320/240/landscape'],
    }),
  );

  console.log('Hike saved.');
})();
