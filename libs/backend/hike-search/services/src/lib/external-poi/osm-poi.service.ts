import * as _ from 'lodash';
import * as fp from 'lodash/fp';
import { Observable, of } from 'rxjs';
import { tap, catchError, map, take } from 'rxjs/operators';
import { OsmPoiTypes, ExternalPoi } from './lib/types';
import { Logger } from '../bunyan-logger';
import { YahaApi } from '@yaha/gql-api';
import { HttpClient } from '../http';
import { LanguageFp } from '../language';
import { buildRetryLogic } from '@yaha/shared/utils';
import { BoundingBox } from '../geometry';

interface OsmPoiResponse {
  tags: {
    name: string;
    amenity: string;
    url?: string;
    description?: string;
    alt_name?: string;
  };
  id: number;
  lat: number;
  lon: number;
  type: string;
}

const osmTypeMap = {
  natural: 'osmnatural',
  amenity: 'osmamenity',
  public_transport: 'osmpublictransport',
  emergency: 'osmemergency',
  historic: 'osmhistoric',
  leisure: 'osmleisure',
  man_made: 'osmmanmade',
  military: 'osmmilitary',
  shop: 'osmshop',
  tourism: 'osmtourism',
};

export interface OsmPoiDeps {
  http: HttpClient;
}

export const getOsmPois =
  (deps: OsmPoiDeps) =>
  (
    bounds: BoundingBox,
    typeParam: OsmPoiTypes,
    lng = 'en',
  ): Observable<ExternalPoi[]> => {
    console.log(`Getting OSM pois for type ${typeParam}`);
    const languageKey = LanguageFp.shortToLocale(lng);

    const request = `
      <osm-script output="json" timeout="25">
        <union into="_">
          <query into="_" type="node">
            <has-kv k="${typeParam}" modv="" v=""/>
            <bbox-query e="${bounds.NorthEast.longitude}" into="_" n="${bounds.NorthEast.latitude}" s="${bounds.SouthWest.latitude}" w="${bounds.SouthWest.longitude}"/>
          </query>
          <query into="_" type="way">
            <has-kv k="${typeParam}" modv="" v=""/>
            <bbox-query e="${bounds.NorthEast.longitude}" into="_" n="${bounds.NorthEast.latitude}" s="${bounds.SouthWest.latitude}" w="${bounds.SouthWest.longitude}"/>
          </query>
          <query into="_" type="relation">
            <has-kv k="${typeParam}" modv="" v=""/>
            <bbox-query e="${bounds.NorthEast.longitude}" into="_" n="${bounds.NorthEast.latitude}" s="${bounds.SouthWest.latitude}" w="${bounds.SouthWest.longitude}"/>
          </query>
        </union>
        <print e="" from="_" geometry="skeleton" limit="" mode="body" n="" order="id" s="" w=""/>
        <recurse from="_" into="_" type="down"/>
        <print e="" from="_" geometry="skeleton" limit="" mode="skeleton" n="" order="quadtile" s="" w=""/>
      </osm-script>`;

    return deps.http
      .post('https://overpass-api.de/api/interpreter', request)
      .pipe(
        buildRetryLogic<unknown>({}),
        map((response: unknown) => _.get(response, 'elements', [])),
        map(response =>
          fp.filter(
            (_point: OsmPoiResponse) =>
              _.isObject(_point) &&
              _point.type === 'node' &&
              isFinite(_point.lat) &&
              _.isObject(_point.tags),
          )(response),
        ),
        //  switchMap(response => validateResponse(response)),
        map((response: OsmPoiResponse[]) =>
          fp.flow(
            fp.map((_point: OsmPoiResponse) => {
              const type = _.get(_point.tags, typeParam);

              return {
                location: {
                  lat: _point.lat,
                  lon: _point.lon,
                },
                type: `${typeParam}:${type}`,
                description: {
                  languageKey,
                  title: _point.tags.name,
                  type: YahaApi.DescriptionType.plaintext,
                },
                externalId: `${osmTypeMap[typeParam]}:${_point.id.toString()}`,
              } as ExternalPoi;
            }),
          )(response),
        ),
        tap(res =>
          console.log(`Found ${res.length} OSM pois of type ${typeParam}`),
        ),
        take(1),
        catchError(err => {
          Logger.error(`Error in OSM POI fetch`);
          Logger.debug(err);
          return of([]);
        }),
      );
  };
