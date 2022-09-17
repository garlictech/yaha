import lineChunk from '@turf/line-chunk';
import { Neo4jdeps } from './utils';
import { from, defer, of, forkJoin, Observable } from 'rxjs';
import {
  map,
  concatMap,
  switchMap,
  tap,
  toArray,
  catchError,
  takeLast,
  delay,
  mapTo,
  count,
} from 'rxjs/operators';
import { pipe } from 'fp-ts/lib/function';
import * as R from 'ramda';
import { lineString, LineString, FeatureCollection } from '@turf/helpers';
import { Feature, Polygon, Properties } from '@turf/turf';
import {
  EBuffer,
  RouteSegmentFp,
  ExternalImage,
  ExternalPoi,
  getFlickrImages,
  isCreatePoiInput,
  filterPointsCloseToReferencePoints,
  isPointInsidePolygon,
  removePointsOutsideOfPolygon,
  isCreateImageInput,
  getOsmPois,
  getAllWikipediaPois,
  getGooglePois,
} from '@yaha/backend/hike-search/services';
import { BoundingBox } from '@yaha/backend/hike-search/services';

export interface HikeData {
  externalId: string;
  title: string;
  description?: string;
  summary?: string;
  languageKey: string;
}

interface HikeData_WithBuffers extends HikeData {
  bigBuffer: BufferType;
  smallBuffer: BufferType;
}

const checkCoordinates = (coordinates: number[][]) =>
  R.tap(() =>
    coordinates.forEach((point, index) => {
      if (point.length != 3 || point[2] === undefined || point[2] === null) {
        throw `Found invalid point at index : ${index}`;
      }
    }),
  );

const sanitizeText = (text?: string) => text?.replace("'", "\\'");

const createDescription = (title: string, summary?: string) =>
  `
merge (hikeDesc:Description {languageKey: "hu_HU", title: "${sanitizeText(
    title,
  )}", summary: "${sanitizeText(summary)}", type: "plaintext"})
merge (hikeDesc)-[:EXPLAINS]->(hike)
  `;

const createRouteChunks = (path: FeatureCollection<LineString>) =>
  pipe(
    lineChunk(path, 2, {
      units: 'kilometers',
    }),
    x => x.features,
    R.map(x => x.geometry.coordinates),
  );

export const addRouteToNeo4j =
  (deps: Neo4jdeps) => (hikeData: HikeData) => (coordinates: number[][]) =>
    pipe(
      coordinates,
      checkCoordinates,
      () => `
merge (route:Route {id: "${hikeData.externalId}"})
merge (hike:Hike {id: "${hikeData.externalId}"})
merge (hike)-[:GOES_ON]->(route)
      `,
      res => res + createDescription(hikeData.title, hikeData.summary),
      query => defer(() => deps.session.writeTransaction(tx => tx.run(query))),
      switchMap(() =>
        from(
          coordinates.map(
            (point, index) => `
match (route:Route {id: "${hikeData.externalId}"})
merge (p:Waypoint {location: Point({latitude: ${point[1]}, longitude: ${point[0]}, height: ${point[2]}})})
merge (route)-[r:CONTAINS]->(p)
set r.orderIndex = ${index}
          `,
          ),
        ),
      ),
      concatMap(query =>
        defer(() => deps.session.writeTransaction(tx => tx.run(query))),
      ),
      count(),
      tap(x => console.log(`Added ${x} points to the route`)),
    );

type BufferType = Feature<Polygon, Properties>;

const getBounds = (segment: Feature<LineString>) => ({
  boundingBox: RouteSegmentFp.calculatePoiSearchBox(segment),
  bigBuffer: RouteSegmentFp.calculateBufferOfLine(EBuffer.BIG)(segment),
  smallBuffer: RouteSegmentFp.calculateBufferOfLine(EBuffer.SMALL)(segment),
});

export enum OsmPoiTypes {
  natural = 'natural',
  amenity = 'amenity',
  publicTransport = 'public_transport',
  emergency = 'emergency',
  historic = 'historic',
  leisure = 'leisure',
  manMade = 'man_made',
  military = 'military',
  shop = 'shop',
  tourism = 'tourism',
}

const osmPois =
  (
    osmPoiService: (
      bounds: BoundingBox,
      typeParam: OsmPoiTypes,
    ) => Observable<ExternalPoi[]>,
  ) =>
  (bounds: BoundingBox): Observable<ExternalPoi[]> =>
    from([
      OsmPoiTypes.publicTransport,
      OsmPoiTypes.amenity,
      OsmPoiTypes.natural,
      OsmPoiTypes.emergency,
      OsmPoiTypes.historic,
      OsmPoiTypes.leisure,
      OsmPoiTypes.manMade,
      OsmPoiTypes.military,
      OsmPoiTypes.shop,
      OsmPoiTypes.tourism,
    ]).pipe(
      concatMap((osmPoiType: OsmPoiTypes) =>
        osmPoiService(bounds, osmPoiType).pipe(delay(2000)),
      ),
      toArray(),
      map(R.flatten),
    );

const getElevation =
  (deps: Neo4jdeps) =>
  (lat: number, lon: number): Observable<number> =>
    pipe(
      deps.http.get(
        `https://api.open-elevation.com/api/v1/lookup?locations=${lat},${lon}`,
      ),
      map(res => res.results[0].elevation),
    );

const addPoiToDb =
  (deps: Neo4jdeps) =>
  (hikeData: HikeData_WithBuffers) =>
  (poi: ExternalPoi) => {
    const relation = isPointInsidePolygon(hikeData.smallBuffer, poi)
      ? 'ON_ROUTE'
      : 'OFF_ROUTE';

    return pipe(
      `
match (route:Route) where route.id = "${hikeData.externalId}"
merge (poi:Poi {id: "${poi.externalId}"})
merge (poi)-[:${relation}]->(route)
merge (w:Waypoint {location: Point({latitude: ${poi.location.lat}, longitude: ${poi.location.lon}, height: ${poi.elevation}})})
merge (poi)-[:LOCATED_AT]->(w)
`,
      res => (poi.type ? `${res}set poi.type = "${poi.type}"\n` : res),
      res => (poi.address ? `${res}set poi.address = "${poi.address}"\n` : res),
      res =>
        poi.phoneNumber ? `${res}set poi.phone = "${poi.phoneNumber}"\n` : res,
      res => (poi.infoUrl ? `${res}set poi.infoUrl = "${poi.infoUrl}"\n` : res),
      res =>
        poi.description?.title
          ? pipe(
              `${res}
merge (desc:Description {languageKey: "${
                poi.description.languageKey
              }", source: "${poi.externalId}"})
set desc.title = '${sanitizeText(poi.description.title)}'
set desc.type = "${poi.description.type || 'plaintext'}"
mhealthpublic_transport:stationshop:generalerge (desc)-[:EXPLAINS]->(poi)
            `,
              descRes =>
                poi.description?.summary
                  ? `${descRes}set desc.summary = '${sanitizeText(
                      poi.description.summary,
                    )}'
            `
                  : descRes,
            )
          : res,
      //of,
      query => defer(() => deps.session.writeTransaction(tx => tx.run(query))),
    );
  };

const isBannedPoi = (poi: { type?: string }) =>
  (!R.isEmpty(poi.type) &&
    [
      'accounting',
      'insurance_agency',
      'moving_company',
      'painter',
      'real_estate_agency',
      'roofing_contractor',
      'travel_agency',
      'general_contractor',
      'car_dealer',
      //
      'electrician',
      'finance',
      // eslint-disable-next-line @typescript-eslint/no-non-null-assertion
    ].includes(poi.type!)) ??
  false;

const poiTypeConversion: Record<string, string> = {
  'historic:yes': 'historic:unknown',
  tourist_attraction: 'tourism:attraction',
  point_of_interest: 'yaha:unknown',
  lodging: 'tourism:hotel',
  health: 'amenity:doctors',
  transit_station: 'public_transport:station',
  store: 'shop:general',
  grocery_or_supermarket: 'shop:supermarket',
};

export const getExternalPois =
  (deps: Neo4jdeps) =>
  (
    bounds: BoundingBox,
    allLanguages: string[],
    hikeData: HikeData_WithBuffers,
  ): Observable<ExternalPoi[]> => {
    const calc1 = forkJoin([
      getAllWikipediaPois(deps)(bounds, allLanguages),
      osmPois(getOsmPois(deps))(bounds),
      getGooglePois({
        apiKey: deps.googleApiKey,
        http: deps.http,
      })(bounds),
    ]).pipe(
      map(pois =>
        pipe(
          R.flatten(pois),
          R.tap(res =>
            console.warn('Number of external poi candidates:', res.length),
          ),
          R.filter(poi => isCreatePoiInput(poi)),
          R.uniqBy(poi => poi.externalId),
          R.reject((x: { type?: string }) => isBannedPoi(x)),
          R.map(x => ({
            ...x,
            type: poiTypeConversion[x.type ?? 'foobar'] ?? x.type,
          })),
          x => x,
          R.tap(res =>
            console.warn('Number of correct unique external pois:', res.length),
          ),
        ),
      ),
      map(
        R.filter((poi: ExternalPoi) =>
          isPointInsidePolygon(hikeData.bigBuffer, poi),
        ),
      ),
    );

    return calc1.pipe(
      switchMap(x => from(x)),
      concatMap(poi =>
        getElevation(deps)(poi.location.lat, poi.location.lon).pipe(
          map(elevation => ({
            ...poi,
            elevation,
          })),
          delay(200),
        ),
      ),
      toArray(),
      map(R.reject((poi: ExternalPoi) => R.isNil(poi.elevation))),
      switchMap(pois =>
        from(pois).pipe(
          concatMap(addPoiToDb(deps)(hikeData)),
          takeLast(1),
          mapTo(pois),
        ),
      ),
      catchError(err => {
        console.error(`Error in external POI fetch: ${err}`);
        return of([]);
      }),
    );
  };

const addImageToDb = (deps: Neo4jdeps) => (image: ExternalImage) => {
  return pipe(
    `
merge (image:Image {id: "${image.externalId}"})
set image.original = "${image.original}"
set image.card = "${image.card}"
set image.thumbnail = "${image.thumbnail}"
    `,

    query => defer(() => deps.session.writeTransaction(tx => tx.run(query))),
  );
};

export const addPoiImageRelations =
  (deps: Neo4jdeps) => (pois: ExternalPoi[]) => (images: ExternalImage[]) =>
    pipe(
      from(images),
      concatMap(image =>
        pipe(
          filterPointsCloseToReferencePoints<ExternalImage, ExternalPoi>(
            50,
            [image],
            pois,
          ),
          R.map(
            poi =>
              `
match (poi:Poi) where poi.id = "${poi.externalId}"
match (image:Image) where image.id = "${image.externalId}"
merge (image)-[:TAKEN_AT]->(poi)
      `,
          ),
          x => from(x),
          concatMap(
            //query => of(query),
            query =>
              defer(() => deps.session.writeTransaction(tx => tx.run(query))),
          ),
          toArray(),
        ),
      ),
      toArray(),
      tap(res =>
        console.log(`Processed ${res.length} images to find close pois`),
      ),
    );

export const addRouteImageRelations =
  (deps: Neo4jdeps) =>
  (hikeData: HikeData_WithBuffers) =>
  (images: ExternalImage[]) =>
    pipe(
      removePointsOutsideOfPolygon<ExternalImage>(hikeData.smallBuffer)(images),
      R.map(
        image =>
          `
match (route:Route) where route.id = "${hikeData.externalId}"
match (image:Image) where image.id = "${image.externalId}"
merge (image)-[:TAKEN_AT]->(route)
      `,
      ),
      from,
      concatMap(query =>
        defer(() => deps.session.writeTransaction(tx => tx.run(query))),
      ),
      toArray(),
      tap(res =>
        console.log(`Processed ${res.length} images to find close route`),
      ),
    );

export const getExternalImages =
  (deps: Neo4jdeps) =>
  (
    bounds: BoundingBox,
    hikeData: HikeData_WithBuffers,
    pois: ExternalPoi[],
  ): Observable<boolean> =>
    getFlickrImages(deps)(bounds).pipe(
      map(images =>
        pipe(
          images,
          R.tap(res =>
            console.warn('Number of external image candidates:', res.length),
          ),
          R.filter(image => isCreateImageInput(image)),
          images =>
            R.flatten([
              removePointsOutsideOfPolygon<ExternalImage>(hikeData.smallBuffer)(
                images,
              ),
              filterPointsCloseToReferencePoints<
                { location: { lat: number; lon: number } },
                ExternalImage
              >(50, pois, images),
            ]),
          R.uniqBy(image => image.externalId),
          R.tap(res =>
            console.warn(
              'Number of correct unique external images:',
              res.length,
            ),
          ),
        ),
      ),
      switchMap(images =>
        from(images).pipe(
          concatMap(image => addImageToDb(deps)(image)),
          count(),
          tap(res => console.log(`Added ${res} 🖼  to DB`)),
          switchMap(() => addPoiImageRelations(deps)(pois)(images)),
          switchMap(() => addRouteImageRelations(deps)(hikeData)(images)),
        ),
      ),
      mapTo(true),
      catchError(err => {
        console.error(`Error in external POI fetch: ${err}`);
        return of(false);
      }),
    );

const processSegments =
  (deps: Neo4jdeps) =>
  (hikeData: HikeData_WithBuffers) =>
  (segments: number[][][]) =>
    from(segments).pipe(
      map(x => lineString(x)),
      map(getBounds),
      concatMap(bounds =>
        getExternalPois(deps)(bounds.boundingBox, ['en', 'hu'], hikeData).pipe(
          switchMap(pois =>
            getExternalImages(deps)(bounds.boundingBox, hikeData, pois),
          ),
        ),
      ),
      tap(() => console.warn('One segment processed')),
    );

export const addHike =
  (deps: Neo4jdeps) =>
  ({
    path,
    hikeData,
  }: {
    path: FeatureCollection<LineString>;
    hikeData: HikeData;
  }) => {
    const bounds = getBounds(path.features[0]);
    const hikeDataWithBuf: HikeData_WithBuffers = {
      ...hikeData,
      ...bounds,
    };

    return pipe(
      path?.features?.[0]?.geometry.coordinates,
      addRouteToNeo4j(deps)(hikeData),
      map(() => createRouteChunks(path)),
      switchMap(processSegments(deps)(hikeDataWithBuf)),
    );
  };
/* 
  match (w:Waypoint) where point.distance(point({latitude: w.latitude, longitude: w.longitude}), point({latitude: 47.858627, longitude: 19.99034})) < 20000
  match (h:Hike)-[:GOES_ON]->(:Route)-[:CONTAINS]->(w)
  return collect(distinct h) limit 25

match (a) -[r] -> () delete a, r;
match (b) delete b;
CREATE CONSTRAINT unique_route IF NOT EXISTS FOR (route:Route) REQUIRE route.externalId IS UNIQUE;
CREATE CONSTRAINT unique_hike IF NOT EXISTS FOR (hike:Hike) REQUIRE hike.externalId IS UNIQUE;


 */
