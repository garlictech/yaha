import * as fp from 'lodash/fp';
import * as O from 'fp-ts/lib/Option';
import { YahaApi } from '@yaha/gql-api';

const mapObjectTypeUrl = (objectType: YahaApi.PoiSource): string =>
  objectType === YahaApi.PoiSource.google ? 'website' : objectType;

export class PoiFp {
  static collectUrls(poi: YahaApi.Poi): { urlType: string; url: string }[] {
    return fp.flow(
      fp.filter((obj: YahaApi.PoiSourceObject) => !fp.isEmpty(obj.url)),
      fp.map(({ objectType, url }) => ({
        urlType: mapObjectTypeUrl(objectType),
        url: url as string,
      })),
      x => (fp.isArray(x) ? x : []),
    )(poi.sourceObject);
  }

  static bannedTypes(): string[] {
    return ['political'];
  }

  static topInterestTypes(): string[] {
    return [
      'peak',
      'sight',
      'city',
      'archaeological_site',
      '	battlefield',
      'building',
      'castle',
      'castle_wall',
      'church',
      'city_gate',
      'citywalls',
      'farm',
      'fort',
      'gallows',
      'highwater_mark',
      'locomotive',
      'manor',
      'memorial',
      'milestone',
      'monastery',
      'monument',
      'ruins',
      'rune_stone',
      'ship',
      'tomb',
      'tower',
      'wayside_cross',
      'wayside_shrine',
      'wreck',
      'attraction',
      'artwork',
      'viewpoint',
      'natural_reserve',
    ];
  }

  static getMostInterestingPoiType(types: string[]): O.Option<string> {
    return fp.flow(
      () => fp.intersection(PoiFp.topInterestTypes(), types),
      fp.first,
      O.fromNullable,
    )();
  }

  static filterTopInterestPois(pois: YahaApi.Poi[]): YahaApi.Poi[] {
    const selectorFv = fp.flow(
      (poi: YahaApi.Poi) => poi.types,
      (types: string[]) => fp.intersection(PoiFp.topInterestTypes(), types),
      fp.negate(fp.isEmpty),
    );

    return fp.filter(selectorFv)(pois);
  }

  static filterSecondaryInterestPois(pois: YahaApi.Poi[]): YahaApi.Poi[] {
    const selectorFv = fp.flow(
      (poi: YahaApi.Poi) => poi.types,
      (types: string[]) => fp.intersection(PoiFp.topInterestTypes(), types),
      fp.isEmpty,
    );

    return fp.filter(selectorFv)(pois);
  }

  static createPoiUpdateData(poi: YahaApi.Poi): YahaApi.UpdatePoiInput {
    const removeTypename = fp.map(fp.omitBy(fp.isNull));

    return fp.flow(
      fp.omitBy(fp.isNull),
      fp.omit(['createdAt', 'updatedAt']),
      (updatedPoi: Partial<YahaApi.Poi>) =>
        ({
          ...updatedPoi,
          sourceObject: removeTypename(updatedPoi.sourceObject),
          description: removeTypename(updatedPoi.description),
        } as YahaApi.UpdatePoiInput),
    )(poi);
  }
}

export const getMostInterestingPoiType = fp.flow(
  fp.intersection(PoiFp.topInterestTypes()),
  fp.first,
  O.fromNullable,
);
