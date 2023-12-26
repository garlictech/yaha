import { ExternalPoi } from '@yaha/backend/hike-search/services';
import * as R from 'ramda';
import { pipe } from 'fp-ts/lib/function';
import * as path from 'path';
import * as fs from 'fs';
import * as child_process from 'child_process';

const yahaAppAssetLocation = (projectRoot: string) =>
  path.join(projectRoot, 'libs', 'flutter', 'yaha-lib', 'assets');

export const yahaAppPoiIconLocation = (projectRoot: string) =>
  path.join(yahaAppAssetLocation(projectRoot), 'poi-icons');

export const yahaAppPoiBackgroundLocation = (projectRoot: string) =>
  path.join(yahaAppAssetLocation(projectRoot), 'poi-backgrounds');

export const yahaPoiIconCreatorScriptLocation = (projectRoot: string) =>
  path.join(projectRoot, 'tools', 'generate_icon_with_chatgpt.sh');

export const yahaPoiBackgroundCreatorScriptLocation = (projectRoot: string) =>
  path.join(projectRoot, 'tools', 'generate_poi_background_with_chatgpt.sh');

export const isTypeImageExists = (imageFolder: string) => (type: string) => {
  const filePath = path.join(imageFolder, `${type}.svg`);

  return fs.existsSync(filePath);
};

export const getTypesWithNoImages =
  (imageFolder: string) => (externalPois: ExternalPoi[]) => {
    if (!fs.existsSync(imageFolder)) {
      fs.mkdirSync(imageFolder);
    }

    console.log(`Processing POI icons. Target location: ${imageFolder}`);

    return pipe(
      externalPois,
      R.map(x => x.type),
      R.reject(R.isNil),
      x => x as string[],
      R.map(R.split(':')),
      R.map(R.last),
      R.reject(R.isNil),
      x => x as string[],
      R.uniq,
      R.reject(isTypeImageExists(imageFolder)),
    );
  };

export const generateImageForPoiTypes =
  (scriptLocation: string) => (tags: string[]) => {
    return pipe(
      tags,
      R.tap(tags =>
        console.log(`Generating icons with chatGPT for tags: ${tags}`),
      ),
      R.map(tag => `${scriptLocation} ${tag}`),
      R.forEach(child_process.execSync),
      () => tags,
    );
  };

export const generateIconForExternalPois =
  (projectRoot: string) => (externalPois: ExternalPoi[]) => {
    const imageFolder = yahaAppPoiIconLocation(projectRoot);

    const scriptLocation = yahaPoiIconCreatorScriptLocation(projectRoot);

    return pipe(
      externalPois,
      getTypesWithNoImages(imageFolder),
      generateImageForPoiTypes(scriptLocation),
      () => externalPois,
    );
  };

export const generateBackgroundForExternalPois =
  (projectRoot: string) => (externalPois: ExternalPoi[]) => {
    const imageFolder = yahaAppPoiBackgroundLocation(projectRoot);

    const scriptLocation = yahaPoiBackgroundCreatorScriptLocation(projectRoot);

    return pipe(
      externalPois,
      getTypesWithNoImages(imageFolder),
      generateImageForPoiTypes(scriptLocation),
      () => externalPois,
    );
  };
