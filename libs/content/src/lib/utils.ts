import { Driver, Session } from 'neo4j-driver';
import { HttpClientImpl } from '@yaha/backend/hike-search/services';
import { Client as GoogleMapsClient } from '@googlemaps/google-maps-services-js';

export interface Neo4jdeps {
  driver: Driver;
  session: Session;
  googleApiKey: string;
  flickrApiKey: string;
  http: HttpClientImpl;
  googleMapsClient: GoogleMapsClient;
}
