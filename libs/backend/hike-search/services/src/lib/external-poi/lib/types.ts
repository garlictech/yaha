import { YahaApi } from '@yaha/gql-api';

export interface ExternalPoi {
  externalId: string;
  location: {
    lat: number;
    lon: number;
  };
  description: YahaApi.Description;
  type?: string;
  infoUrl?: string;
  address?: string;
  openingHours?: string;
  phoneNumber?: string;
  elevation?: number;
}

export interface ExternalImage {
  externalId: string;
  location: {
    lat: number;
    lon: number;
  };
  original: string;
  card: string;
  thumbnail: string;
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
