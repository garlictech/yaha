import { tap, toArray } from 'rxjs/operators';
import { DOMParser } from 'xmldom';
const togeojson = require('@mapbox/togeojson');
import { Neo4jdeps } from './utils';
import { addHike } from './add-hike';

const domParser = new DOMParser();

export const processHikeFromGpx =
  (deps: Neo4jdeps) => (gpx: string, externalId: string) => {
    const _doc = domParser.parseFromString(gpx, 'application/xml');
    const geojson = togeojson.gpx(_doc);

    return addHike(deps)({
      path: geojson,
      hikeData: {
        externalId,
        languageKey: 'hu_HU',
        title: geojson?.features?.[0]?.properties?.name,
        summary: geojson?.features?.[0]?.properties?.desc,
      },
    }).pipe(
      toArray(),
      tap(res =>
        console.log(
          `Hike upload result for route ${externalId} is OK, with ${res.length} segments.`,
        ),
      ),
    );
  };
