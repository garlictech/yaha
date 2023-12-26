import { ExternalPoi } from '@yaha/backend/hike-search/services';
import * as R from 'ramda';
import { pipe } from 'fp-ts/lib/function';
import path from 'path';
import fs from 'fs';

const yahaAppPoiLocation = (project_root: string) =>
  path.join(project_root, 'libs', 'flutter', 'yaha-lib', 'assets', 'poi_icons');

const isTypeIconExists = (poiLocation: string) => (type: string) => {
  const filePath = path.join(poiLocation, `${type}.svg`);

  return fs.existsSync(filePath);
};

export const processPoiIcons =
  (project_root: string) => (externalPois: ExternalPoi[]) => {
    const poiLocation = yahaAppPoiLocation(project_root);

    if (!fs.existsSync(poiLocation)) {
      fs.mkdirSync(poiLocation);
    }

    console.log(
      `Processing POI icons. Target location: ${yahaAppPoiLocation(
        project_root,
      )}`,
    );

    return pipe(
      externalPois,
      R.map(x => x.type),
      x => x,
      R.reject(R.isNil),
      x => x as string[],
      R.uniq,
      R.reject(isTypeIconExists(yahaAppPoiLocation(project_root))),
    );
  };
