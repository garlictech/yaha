import { Neo4jdeps } from './utils';
import { defer } from 'rxjs';
import { pipe } from 'fp-ts/lib/function';
import * as R from 'ramda';

export interface HikeData {
  externalId: string;
  title: string;
  description?: string;
  summary?: string;
  languageKey: string;
}

const checkCoordinates = (coordinates: number[][]) =>
  R.tap(() =>
    coordinates.forEach((point, index) => {
      if (point.length != 3 || point[2] === undefined || point[2] === null) {
        throw `Found invalid point at index : ${index}`;
      }
    }),
  );

const createWaypoints = (coordinates: number[][]) =>
  pipe(
    coordinates.reduce(
      (prev, point, index) =>
        `${prev}\nmerge (p${index}:Waypoint {latitude: ${point[1]}, longitude: ${point[0]}, height: ${point[2]}})`,
      '',
    ),
  );

const createNextRelations = (coordinates: number[][]) =>
  pipe(
    coordinates.length,
    R.range(1),
    R.reduce(
      (prev, curr) => `${prev}\nmerge (p${curr - 1})-[:NEXT]->(p${curr})`,
      '',
    ),
  );

const createContainsRelations = (coordinates: number[][]) =>
  pipe(
    coordinates.length,
    R.range(0),
    R.reduce((prev, curr) => `${prev},p${curr}`, 'p0'),
    res => `foreach (n IN [${res}] | merge (route)-[:CONTAINS]->(n))`,
  );

const createEndpointRelations = (coordinates: number[][]) =>
  `merge (route)-[:STARTS]->(p0)\nmerge (route)-[:ENDS]->(p${
    coordinates.length - 1
  })`;

const createDescription = (title: string, summary?: string) =>
  `
  merge (hikeDesc:Description {languageKey: "hu_HU", title: "${title}", summary: "${summary}"})
  merge (hikeDesc)-[:EXPLAINS]->(hike)
  `;

export const addRouteToNeo4j =
  (deps: Neo4jdeps) => (coordinates: number[][], hikeData: HikeData) =>
    pipe(
      coordinates,
      checkCoordinates,
      () => `
      merge (route:Route {id: "${hikeData.externalId}"})
      merge (hike:Hike {id: "${hikeData.externalId}"})
      merge (hike)-[:GOES_ON]->(route)
      `,
      res => res + createDescription(hikeData.title, hikeData.summary),
      /*res =>
      [
        createWaypoints,
        createNextRelations,
        createContainsRelations,
        createEndpointRelations,
      ].reduce((prev, fv) => prev + '\n' + fv(coordinates), res),
  */
      //query => of(query),
      query => defer(() => deps.session.writeTransaction(tx => tx.run(query))),
    );

/* 
  match (w:Waypoint) where point.distance(point({latitude: w.latitude, longitude: w.longitude}), point({latitude: 47.858627, longitude: 19.99034})) < 20000
  match (h:Hike)-[:GOES_ON]->(:Route)-[:CONTAINS]->(w)
  return collect(distinct h) limit 25

match (a) -[r] -> () delete a, r;
match (b) delete b;
CREATE CONSTRAINT unique_route IF NOT EXISTS FOR (route:Route) REQUIRE route.externalId IS UNIQUE;
CREATE CONSTRAINT unique_hike IF NOT EXISTS FOR (hike:Hike) REQUIRE hike.externalId IS UNIQUE;


 */
