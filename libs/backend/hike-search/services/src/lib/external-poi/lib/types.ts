import { YahaApi } from '@yaha/gql-api';

export type ExternalPoi = YahaApi.CreatePoiInput;

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
