import { YahaApi } from '@yaha/gql-api';

export interface ExternalPoi extends YahaApi.CreatePoiInput {
  sourceObject: YahaApi.PoiSourceObject;
}

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

export interface GoogleApiConfig {
  apiKey: string;
}
