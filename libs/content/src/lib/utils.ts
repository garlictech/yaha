import { Driver, Session } from 'neo4j-driver';

export interface Neo4jdeps {
  driver: Driver;
  session: Session;
}
