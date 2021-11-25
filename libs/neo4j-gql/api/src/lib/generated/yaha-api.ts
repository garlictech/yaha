import { Observable } from 'rxjs';
import { DocumentNode } from 'graphql';
import gql from 'graphql-tag';
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
/** All built-in and custom scalars, mapped to their actual values */
export interface Scalars {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
}

export interface BoundingBox {
  NorthEast: Point;
  SouthWest: Point;
}

export type Checkpoint = Poi | Point;

export interface Hike {
  checkpoints?: Maybe<Array<Maybe<Checkpoint>>>;
  description: Array<TextualDescription>;
  endPoint: Point;
  featured?: Maybe<Scalars['Boolean']>;
  featuredStops?: Maybe<Array<Maybe<HikeStop>>>;
  id: Scalars['ID'];
  location: Scalars['String'];
  offlineMap?: Maybe<Scalars['String']>;
  publicationState: PublicationState;
  rate?: Maybe<Scalars['String']>;
  route: RouteData;
  startPoint: Point;
  tags?: Maybe<Array<Scalars['String']>>;
}

export interface HikeStop {
  description?: Maybe<Array<TextualDescription>>;
  poiId: Scalars['ID'];
}

export interface Poi {
  address?: Maybe<Scalars['String']>;
  description: Array<TextualDescription>;
  id: Scalars['ID'];
  location: Point;
  openingHours?: Maybe<Scalars['String']>;
  phoneFloat?: Maybe<Scalars['String']>;
  sourceObject: Array<PoiSourceObject>;
  tags?: Maybe<Array<Scalars['String']>>;
  types?: Maybe<Array<Scalars['String']>>;
}

export enum PoiSource {
  flickr = 'flickr',
  google = 'google',
  mapillary = 'mapillary',
  osmamenity = 'osmAmenity',
  osmemergency = 'osmEmergency',
  osmhistoric = 'osmHistoric',
  osmleisure = 'osmLeisure',
  osmmanmade = 'osmManMade',
  osmmilitary = 'osmMilitary',
  osmnatural = 'osmNatural',
  osmpublictransport = 'osmPublicTransport',
  osmroute = 'osmRoute',
  osmshop = 'osmShop',
  osmtourism = 'osmTourism',
  wikipedia = 'wikipedia'
}

export interface PoiSourceObject {
  languageKey?: Maybe<Scalars['String']>;
  objectId: Scalars['String'];
  objectType: PoiSource;
  url?: Maybe<Scalars['String']>;
}

export interface Point {
  ele?: Maybe<Scalars['Float']>;
  lat: Scalars['Float'];
  lon: Scalars['Float'];
}

export enum PublicationState {
  archived = 'archived',
  draft = 'draft',
  published = 'published'
}

export interface RouteData {
  averageTime: Scalars['Int'];
  bigBuffer: Array<Array<Array<Scalars['Float']>>>;
  bounds: BoundingBox;
  difficulty: Scalars['Int'];
  distance: Scalars['Int'];
  downhill: Scalars['Int'];
  isRoundTrip: Scalars['Boolean'];
  poiSearchBox: BoundingBox;
  score: Scalars['Int'];
  smallBuffer: Array<Array<Array<Scalars['Float']>>>;
  track: Array<Array<Scalars['Float']>>;
  uphill: Scalars['Int'];
}

export interface TextualDescription {
  fullDescription?: Maybe<Scalars['String']>;
  languageKey: Scalars['String'];
  summary?: Maybe<Scalars['String']>;
  title?: Maybe<Scalars['String']>;
  type: TextualDescriptionType;
}

export enum TextualDescriptionType {
  html = 'html',
  markdown = 'markdown'
}


export type Requester<C= {}> = <R, V>(doc: DocumentNode, vars?: V, options?: C) => Promise<R> & Observable<R>
export function getSdk<C>(requester: Requester<C>) {
  return {

  };
}
export type Sdk = ReturnType<typeof getSdk>;