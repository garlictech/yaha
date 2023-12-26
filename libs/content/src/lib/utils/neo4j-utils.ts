import { Driver } from 'neo4j-driver';
import { defer, delay, retryWhen, take, tap } from 'rxjs';

export const retriableNeo4jQuery = (driver: Driver) => (query: string) =>
  defer(() => driver.executeQuery(query)).pipe(
    retryWhen(errors =>
      errors.pipe(
        tap(errors => console.warn('Neo4j error, retrying...', errors)),
        delay(1000),
        take(3),
      ),
    ),
  );
