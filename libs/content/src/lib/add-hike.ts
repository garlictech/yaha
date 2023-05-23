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
  delay,
  mapTo,
  takeLast,
  concatAll,
} from 'rxjs/operators';
import { flow, pipe } from 'fp-ts/lib/function';
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

const chunkSize = 100;

const checkCoordinates = (coordinates: number[][]) =>
  R.tap(() =>
    coordinates.forEach((point, index) => {
      if (point.length != 3 || point[2] === undefined || point[2] === null) {
        throw `Found invalid point at index : ${index}`;
      }
    }),
  );

const sanitizeText = (text?: string) =>
  text?.replaceAll("'", "\\'").replaceAll('"', '\\"');

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
      map(() =>
        pipe(
          coordinates.map(
            (point, index) => `
call {
  merge (p:Waypoint {id: "${point[1]}${point[0]}"})
  set p.location = Point({latitude: ${point[1]}, longitude: ${point[0]}, height: ${point[2]}})
  merge (route)-[r:CONTAINS]->(p)
  set r.orderIndex = ${index}
}
          `,
          ),
          R.splitEvery(chunkSize),
          R.map(chunk =>
            pipe(
              chunk,
              R.join('\n'),
              res => `
match (route:Route {id: "${hikeData.externalId}"})
${res}

`,
              query =>
                defer(() => deps.session.writeTransaction(tx => tx.run(query))),
              tap(() =>
                console.log(
                  `${chunk.length} waypoints added to the route in DB`,
                ),
              ),
            ),
          ),
        ),
      ),
      from,
      concatAll(),
      takeLast(1),
      tap(() => console.log(`Added the points to the route in DB`)),
      map(
        () => `
match (r:Route {id: "${hikeData.externalId}"})-[c:CONTAINS]->(w:Waypoint) where c.orderIndex = 0
CALL apoc.spatial.reverseGeocode(w.location.latitude, w.location.longitude) yield data
unwind [data.village, data.town, data.city] as m 
with r, m where m is not null
set r.municipality = m
        `,
      ),
      switchMap(query =>
        defer(() => deps.session.writeTransaction(tx => tx.run(query))),
      ),
      tap(() => console.log(`Added municipality to the route`)),
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
        // `https://api.open-elevation.com/api/v1/lookup?locations=${lat},${lon}`,
        `http://192.168.68.129:9080/api/v1/lookup?locations=${lat},${lon}`,
      ),
      map(res => res.results[0].elevation),
    );

const addPoisToDb =
  (deps: Neo4jdeps) =>
  (hikeData: HikeData_WithBuffers) =>
  (pois: ExternalPoi[]) => {
    const relation = (poi: ExternalPoi) =>
      isPointInsidePolygon(hikeData.smallBuffer, poi)
        ? 'ON_ROUTE'
        : 'OFF_ROUTE';

    return pipe(
      pois,
      R.map(poi =>
        pipe(
          `
call {
merge (poi:Poi {id: "${poi.externalId}"})
merge (poi)-[:${relation(poi)}]->(route)
merge (w:Waypoint {id: "${poi.location.lat}${poi.location.lon}"})
set w.location = Point({latitude: ${poi.location.lat}, longitude: ${
            poi.location.lon
          }, height: ${poi.elevation}})
merge (poi)-[:LOCATED_AT]->(w)
`,
          res => (poi.type ? `${res}set poi.type = "${poi.type}"\n` : res),
          res =>
            poi.address ? `${res}set poi.address = "${poi.address}"\n` : res,
          res =>
            poi.phoneNumber
              ? `${res}set poi.phone = "${poi.phoneNumber}"\n`
              : res,
          res =>
            poi.infoUrl ? `${res}set poi.infoUrl = "${poi.infoUrl}"\n` : res,
          res =>
            poi.description?.title
              ? pipe(
                  `${res}
merge (desc:Description {languageKey: "${
                    poi.description.languageKey
                  }", source: "${poi.externalId}"})
set desc.title = "${sanitizeText(poi.description.title)}"
set desc.type = "${poi.description.type || 'plaintext'}"
merge (desc)-[:EXPLAINS]->(poi)
            `,
                  descRes =>
                    poi.description?.summary
                      ? `${descRes}set desc.summary = "${sanitizeText(
                          poi.description.summary,
                        )}"
            `
                      : descRes,
                )
              : res,
          res => `
  ${res}
}
              `,
        ),
      ),
      R.splitEvery(chunkSize),
      R.map(chunk =>
        pipe(
          chunk,
          R.tap(chunk =>
            console.log(`Start adding ${chunk.length} external pois to the DB`),
          ),
          R.join('\n'),
          res => `
match (route:Route) where route.id = "${hikeData.externalId}"
${res}
`,
          query =>
            defer(() => deps.session.writeTransaction(tx => tx.run(query))),
          tap(() => console.log(`${chunk.length} External pois added to DB`)),
        ),
      ),
      from,
      concatAll(),
      takeLast(1),
      mapTo(pois),
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
      getAllWikipediaPois(deps)(bounds, allLanguages).pipe(
        catchError(err => {
          console.error(`Error in wikipedia POI fetch: ${err}`);
          return of([]);
        }),
      ),
      osmPois(getOsmPois(deps))(bounds).pipe(
        catchError(err => {
          console.error(`Error in OSM POI fetch: ${err}`);
          return of([]);
        }),
      ),
      getGooglePois({
        apiKey: deps.googleApiKey,
        http: deps.http,
      })(bounds).pipe(
        catchError(err => {
          console.error(`Error in Google POI fetch: ${err}`);
          return of([]);
        }),
      ),
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
        ),
      ),
      toArray(),
      map(R.reject((poi: ExternalPoi) => R.isNil(poi.elevation))),
      tap(res =>
        console.warn('Number of external external pois to DB:', res.length),
      ),
      tap(() => console.log('Processing external pois...')),
      switchMap(addPoisToDb(deps)(hikeData)),
      tap(() => console.log('Pois added to DB')),
    );
  };

const addImagesToDb = (deps: Neo4jdeps) => (images: ExternalImage[]) =>
  pipe(
    images,
    R.tap(() => console.log(`Adding ${images.length} 🖼  to DB`)),
    R.map(
      image => `
call {
  merge (image:Image {id: "${image.externalId}"})
  set image.original = "${image.original}"
  set image.card = "${image.card}"
  set image.thumbnail = "${image.thumbnail}"
}
    `,
    ),
    R.splitEvery(chunkSize),
    R.map(chunk =>
      pipe(
        chunk,
        R.tap(chunk => console.log(`Start adding ${chunk.length} 🖼  `)),
        R.join('\n'),
        query =>
          defer(() => deps.session.writeTransaction(tx => tx.run(query))),
        tap(() => console.log(`${chunk.length}  🖼  added`)),
      ),
    ),
    from,
    concatAll(),
    takeLast(1),
  );

export const addPoiImageRelations =
  (deps: Neo4jdeps) => (pois: ExternalPoi[]) => (images: ExternalImage[]) =>
    pipe(
      images,
      R.map(image =>
        pipe(
          filterPointsCloseToReferencePoints<ExternalImage, ExternalPoi>(
            50,
            [image],
            pois,
          ),
          R.map(
            poi =>
              `
call {
  match (poi:Poi) where poi.id = "${poi.externalId}"
  match (image:Image) where image.id = "${image.externalId}"
  merge (image)-[:TAKEN_AT]->(poi)
}
      `,
          ),
        ),
      ),
      R.flatten,
      R.tap(x => console.log(`Adding ${x.length} 🖼 - poi relations to DB`)),
      R.splitEvery(chunkSize),
      R.map(chunk =>
        pipe(
          chunk,
          R.tap(chunk =>
            console.log(
              `Start adding ${chunk.length}  🖼 - poi relations to the DB`,
            ),
          ),
          R.join('\n'),
          query =>
            defer(() => deps.session.writeTransaction(tx => tx.run(query))),
          tap(() =>
            console.log(`${chunk.length} 🖼 - poi relations added to DB`),
          ),
        ),
      ),
      from,
      concatAll(),
      takeLast(1),
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
call {
  match (image:Image) where image.id = "${image.externalId}"
  merge (image)-[:TAKEN_AT]->(route)
}
      `,
      ),
      R.tap(x => console.log(`Adding ${x.length} 🖼 -route relations to DB`)),
      R.splitEvery(chunkSize),
      R.map(chunk =>
        pipe(
          chunk,
          R.tap(chunk =>
            console.log(
              `Start adding ${chunk.length} 🖼 -route relations to the DB`,
            ),
          ),
          R.join('\n'),
          res => `
match (route:Route) where route.id = "${hikeData.externalId}"
${res}
          `,
          query =>
            defer(() => deps.session.writeTransaction(tx => tx.run(query))),
          tap(() =>
            console.log(`${chunk.length} 🖼 -route relations added to DB`),
          ),
        ),
      ),
      from,
      concatAll(),
      takeLast(1),
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
      tap(x => console.log(`Start adding ${x.length} 🖼 to db`)),
      switchMap(images =>
        addImagesToDb(deps)(images).pipe(
          switchMap(() => addPoiImageRelations(deps)(pois)(images)),
          tap(() => console.log(`Added the poi 🖼 relations to DB`)),
          switchMap(() => addRouteImageRelations(deps)(hikeData)(images)),
          tap(() => console.log(`Added the route 🖼 relations to DB`)),
        ),
      ),
      mapTo(true),
      catchError(err => {
        console.error(`Error in external image fetch: ${err}`);
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
      x => x,
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

    console.log('Processing hike ', hikeData.title);

    return from(path?.features?.[0]?.geometry.coordinates).pipe(
      concatMap(coord =>
        coord[2] === undefined
          ? getElevation(deps)(coord[1], coord[0]).pipe(
              map(elev => [coord[0], coord[1], elev]),
            )
          : of(coord),
      ),
      toArray(),
      switchMap(addRouteToNeo4j(deps)(hikeData)),
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
CREATE CONSTRAINT unique_poi IF NOT EXISTS FOR (poi:Poi) REQUIRE poi.id IS UNIQUE;
CREATE CONSTRAINT unique_image IF NOT EXISTS FOR (image:Image) REQUIRE image.id IS UNIQUE;
CREATE CONSTRAINT unique_waypoint IF NOT EXISTS FOR (wp:Waypoint) REQUIRE wp.id IS UNIQUE;



 */
