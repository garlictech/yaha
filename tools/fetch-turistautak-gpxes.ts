//
// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/fetch-turistautak-gpxes.ts
//
/* eslint no-console: "off" */
import axios from 'axios';
import { defer, from, of, tap } from 'rxjs';
import { concatMap, map, switchMap, toArray } from 'rxjs/operators';
import { DOMParser } from 'xmldom';
import * as fs from 'fs';
import * as path from 'path';

const domParser = new DOMParser();

const hikeIds: number[] = [
  113261124, 118158194, 20239810, 22601701, 22605620, 22668771, 22680751,
  22684373, 22690585, 22690716, 22691299, 22695956, 22696121, 22711259,
  22711874, 22720132, 22721173, 22721221, 22725792, 22727140, 22727146,
  22731288, 22760729, 22829303, 22831221, 22852839, 22860187, 22860908,
  22863023, 22864467, 22893358, 22905416, 22906071, 22970503, 22975238,
  22979172, 22983187, 22983332, 22983401, 22984554, 23012848, 23014223,
  23032160, 23045437, 23083111, 23188927, 23229986, 23249195, 23331665,
  23337814, 23382972, 23449390, 23493855, 23497369, 23504964, 23556636,
  23622089,
];

if (!process.env.PROJECT_ROOT) {
  console.error('PROJECT_ROOT env variable is not set.');
  process.exit(1);
}

const deps = {
  projectRoot: process.env.PROJECT_ROOT || '',
};

const state: any = {};

const fetchRoute = (routeId: number) => {
  console.log(`Fetching GPX from Turistautak route id ${routeId}`);
  return defer(() =>
    from(
      axios.get(
        encodeURI(
          `https://regio.outdooractive.com/download.tour.gpx?i=${routeId}&project=oar-hungary&lang=hu`,
        ),
      ),
    ),
  ).pipe(
    map(response => ({
      gpx: response.data,
      filename: path.join(
        deps.projectRoot,
        'tools',
        'saved_gpxes',
        'turistautak',
        `${routeId}.gpx`,
      ),
    })),

    tap(({ gpx, filename }) => fs.writeFileSync(filename, gpx)),
  );
};

console.log('STARTING...');

of(1)
  .pipe(
    switchMap(() => from(hikeIds)),
    concatMap(routeId => fetchRoute(routeId)),
    toArray(),
  )
  .subscribe(x => {
    console.log(`Saved ${x?.length ?? 0} HIKES.`);
  });
