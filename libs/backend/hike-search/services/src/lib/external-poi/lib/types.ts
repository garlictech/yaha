import { YahaApi } from '@yaha/gql-api';
export type PoiSearchOutputType = (ExternalPoi | YahaApi.CreateImageInput)[];

interface ExternalPoiType {
  location: {
    lat: number;
    lon: number;
  };
  elevation: -1;
  id: '';
  types?: string[];
  sourceObject: YahaApi.PoiSourceObject[];
  description: YahaApi.TextualDescription[];
  address?: string;
  phoneNumber?: string;
  openingHours?: string;
}

export type ExternalPoi = Readonly<ExternalPoiType>;

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
