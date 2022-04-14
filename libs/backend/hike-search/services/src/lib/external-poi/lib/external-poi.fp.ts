import { YahaApi } from '@yaha/gql-api';
import { pick } from 'lodash';
import { flow, map, uniq } from 'lodash/fp';
import * as fp from 'lodash/fp';
import * as R from 'ramda';
import { ExternalPoi } from './types';

export class ExternalPoiFp {
  static collectUrls = (poi: ExternalPoi): string | undefined | null =>
    poi.sourceObject.url;

  static collectSourceTypes = (poi: ExternalPoi): string =>
    poi.sourceObject.objectType;

  static collectLanguageKeys = (poi: ExternalPoi): string[] =>
    flow(map('languageKey'), uniq)(poi.description);

  static collectTitles = (poi: ExternalPoi): string[] =>
    map('title')(poi.description);

  static convertToPoiInput = (
    poi: ExternalPoi,
    elevation: number,
  ): YahaApi.CreatePoiInput => ({
    ...pick(poi, [
      'type',
      'description',
      'sourceObject',
      'address',
      'phoneNumber',
      'openingHours',
      'location',
    ]),
    elevation,
  });

  static idFromSourceObject(
    objectType: YahaApi.PoiSource,
    objectId: string,
  ): string {
    return `${objectType}_${objectId}`;
  }

  static thumbnailImageWidth(): number {
    return 320;
  }

  static cardImageWidth(): number {
    return 640;
  }

  static collectObjId<
    T extends {
      sourceObject?: YahaApi.PoiSourceObject[] | YahaApi.PoiSourceObject | null;
    },
  >(pois: T[]): string[] {
    return fp.flow(
      _pois => (fp.isArray(_pois) ? _pois : [_pois]),
      fp.map((x: T) => x.sourceObject),
      fp.flatten,
      R.reject(R.isNil),
      fp.map((sourceObject: YahaApi.PoiSourceObject) =>
        ExternalPoiFp.idFromSourceObject(
          sourceObject.objectType,
          sourceObject.objectId,
        ),
      ),
      fp.uniq,
    )(pois);
  }
}
