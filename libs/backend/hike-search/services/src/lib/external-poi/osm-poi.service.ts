import * as _ from 'lodash';
import * as fp from 'lodash/fp';
import * as Joi from 'joi';
import { Observable, of } from 'rxjs';
import { catchError, map, take } from 'rxjs/operators';
import { OsmPoiTypes, ExternalPoi } from './lib/types';
import { validateSchema } from '../joi-validator';
import { Logger } from '../bunyan-logger';
import { YahaApi } from '@yaha/gql-api';
import { HttpClient } from '../http';
import { LanguageFp } from '../language';
import { buildRetryLogic } from '@yaha/shared/utils';

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

const responseSchema = Joi.array().items(
  Joi.object()
    .keys({
      id: Joi.number().required(),
      lat: Joi.number().required(),
      lon: Joi.number().required(),
      type: Joi.string().required(),
      tags: Joi.object()
        .keys({
          name: Joi.string(),
          amenity: Joi.string(),
          url: Joi.string().uri(),
          description: Joi.string(),
          alt_name: Joi.string(),
        })
        .unknown(),
    })
    .unknown(),
);

const { validate: validateResponse } =
  validateSchema<OsmPoiResponse[]>(responseSchema);

const osmTypeMap = {
  natural: YahaApi.PoiSource.osmnatural,
  amenity: YahaApi.PoiSource.osmamenity,
  public_transport: YahaApi.PoiSource.osmpublictransport,
  emergency: YahaApi.PoiSource.osmemergency,
  historic: YahaApi.PoiSource.osmhistoric,
  leisure: YahaApi.PoiSource.osmleisure,
  man_made: YahaApi.PoiSource.osmmanmade,
  military: YahaApi.PoiSource.osmmilitary,
  shop: YahaApi.PoiSource.osmshop,
  tourism: YahaApi.PoiSource.osmtourism,
};

export interface OsmPoiDeps {
  http: HttpClient;
}

export const getOsmPois =
  (deps: OsmPoiDeps) =>
  (
    bounds: YahaApi.BoundingBox,
    typeParam: OsmPoiTypes,
    lng = 'en',
  ): Observable<ExternalPoi[]> => {
    const languageKey = LanguageFp.shortToLocale(lng);

    const request = `
      <osm-script output="json" timeout="25">
        <union into="_">
          <query into="_" type="node">
            <has-kv k="${typeParam}" modv="" v=""/>
            <bbox-query e="${bounds.NorthEast.lon}" into="_" n="${bounds.NorthEast.lat}" s="${bounds.SouthWest.lat}" w="${bounds.SouthWest.lon}"/>
          </query>
          <query into="_" type="way">
            <has-kv k="${typeParam}" modv="" v=""/>
            <bbox-query e="${bounds.NorthEast.lon}" into="_" n="${bounds.NorthEast.lat}" s="${bounds.SouthWest.lat}" w="${bounds.SouthWest.lon}"/>
          </query>
          <query into="_" type="relation">
            <has-kv k="${typeParam}" modv="" v=""/>
            <bbox-query e="${bounds.NorthEast.lon}" into="_" n="${bounds.NorthEast.lat}" s="${bounds.SouthWest.lat}" w="${bounds.SouthWest.lon}"/>
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

              const sourceObject = [
                {
                  objectType: osmTypeMap[typeParam],
                  languageKey,
                  objectId: _point.id.toString(),
                },
              ];

              return {
                location: {
                  lat: _point.lat,
                  lon: _point.lon,
                },
                types: [`${typeParam}:${type}`],
                description: [
                  {
                    languageKey,
                    title: _point.tags.name,
                    type: YahaApi.TextualDescriptionType.markdown,
                  },
                ],
                sourceObject,
              } as ExternalPoi;
            }),
          )(response),
        ),
        take(1),
        catchError(err => {
          Logger.error(`Error in OSM POI fetch`);
          Logger.debug(err);
          return of([]);
        }),
      );
  };
