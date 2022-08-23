import neo4j from 'neo4j-driver';
import { defer, of } from 'rxjs';
import { map } from 'rxjs/operators';

const neo4jUsername = 'neo4j';
const neo4jPassword = 'LoaFhpCe4xTAvjTxBV4qh60POy4Hi7pC9n2DhhKPQdU';
const neo4jUri = 'neo4j+s://cf48806f.databases.neo4j.io';

const driver = neo4j.driver(
  neo4jUri,
  neo4j.auth.basic(neo4jUsername, neo4jPassword),
);

const session = driver.session({ database: 'neo4j' });

const hikeSearchInCircle = async () =>
  await defer(() =>
    session.writeTransaction(tx =>
      tx.run(`
        match (w:Waypoint) where point.distance(point({latitude: w.latitude, longitude: w.longitude}), point({latitude: 47.858627, longitude: 19.99034})) < 20000
        match (h:Hike)-[:GOES_ON]->(:Route)-[:CONTAINS]->(w)
        return collect(distinct h) limit 25
`),
    ),
  )
    .pipe(map(x => JSON.stringify(x)))
    .toPromise();

// eslint-disable-next-line @typescript-eslint/no-explicit-any
(global as any).hikeSearchInCircle = hikeSearchInCircle;
