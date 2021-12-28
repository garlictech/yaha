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
  AWSDateTime: string;
  AWSTimestamp: unknown;
}

export interface BoundingBox {
  NorthEast: Point;
  SouthWest: Point;
}

export interface BoundingBoxInput {
  NorthEast: PointInput;
  SouthWest: PointInput;
}

export interface CreateHikeInput {
  _version?: InputMaybe<Scalars['Int']>;
  checkpoints?: InputMaybe<Array<InputMaybe<PoiInput>>>;
  description: Array<TextualDescriptionInput>;
  endPoint: PointInput;
  featured?: InputMaybe<Scalars['Boolean']>;
  featuredStops?: InputMaybe<Array<InputMaybe<HikeStopInput>>>;
  id?: InputMaybe<Scalars['ID']>;
  location: Scalars['String'];
  offlineMap?: InputMaybe<Scalars['String']>;
  publicationState: PublicationState;
  rate?: InputMaybe<Scalars['String']>;
  route: RouteDataInput;
  startPoint: PointInput;
  tags?: InputMaybe<Array<Scalars['String']>>;
}

export interface DeleteHikeInput {
  _version?: InputMaybe<Scalars['Int']>;
  id: Scalars['ID'];
}

export interface GetNodeInput {
  id: Scalars['ID'];
  label: ValidDataLabels;
}

export interface HierarchicalNode {
  children?: Maybe<Array<Maybe<Scalars['ID']>>>;
  parent?: Maybe<Scalars['ID']>;
}

export interface Hike {
  _deleted?: Maybe<Scalars['Boolean']>;
  _lastChangedAt: Scalars['AWSTimestamp'];
  _version: Scalars['Int'];
  checkpoints?: Maybe<Array<Maybe<Poi>>>;
  createdAt: Scalars['AWSDateTime'];
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
  updatedAt: Scalars['AWSDateTime'];
}

export interface HikeStop {
  description?: Maybe<Array<TextualDescription>>;
  poiId: Scalars['ID'];
}

export interface HikeStopInput {
  description?: InputMaybe<Array<TextualDescriptionInput>>;
  poiId: Scalars['ID'];
}

export enum ModelAttributeTypes {
  _null = '_null',
  binary = 'binary',
  binaryset = 'binarySet',
  bool = 'bool',
  list = 'list',
  map = 'map',
  number = 'number',
  numberset = 'numberSet',
  string = 'string',
  stringset = 'stringSet'
}

export interface ModelBooleanInput {
  attributeExists?: InputMaybe<Scalars['Boolean']>;
  attributeType?: InputMaybe<ModelAttributeTypes>;
  eq?: InputMaybe<Scalars['Boolean']>;
  ne?: InputMaybe<Scalars['Boolean']>;
}

export interface ModelFloatInput {
  attributeExists?: InputMaybe<Scalars['Boolean']>;
  attributeType?: InputMaybe<ModelAttributeTypes>;
  between?: InputMaybe<Array<InputMaybe<Scalars['Float']>>>;
  eq?: InputMaybe<Scalars['Float']>;
  ge?: InputMaybe<Scalars['Float']>;
  gt?: InputMaybe<Scalars['Float']>;
  le?: InputMaybe<Scalars['Float']>;
  lt?: InputMaybe<Scalars['Float']>;
  ne?: InputMaybe<Scalars['Float']>;
}

export interface ModelHikeConditionInput {
  and?: InputMaybe<Array<InputMaybe<ModelHikeConditionInput>>>;
  featured?: InputMaybe<ModelBooleanInput>;
  location?: InputMaybe<ModelStringInput>;
  not?: InputMaybe<ModelHikeConditionInput>;
  offlineMap?: InputMaybe<ModelStringInput>;
  or?: InputMaybe<Array<InputMaybe<ModelHikeConditionInput>>>;
  publicationState?: InputMaybe<ModelPublicationStateInput>;
  rate?: InputMaybe<ModelStringInput>;
  tags?: InputMaybe<ModelStringInput>;
}

export interface ModelHikeConnection {
  items: Array<Hike>;
  nextToken?: Maybe<Scalars['String']>;
  startedAt?: Maybe<Scalars['AWSTimestamp']>;
}

export interface ModelHikeFilterInput {
  and?: InputMaybe<Array<InputMaybe<ModelHikeFilterInput>>>;
  featured?: InputMaybe<ModelBooleanInput>;
  id?: InputMaybe<ModelIdInput>;
  location?: InputMaybe<ModelStringInput>;
  not?: InputMaybe<ModelHikeFilterInput>;
  offlineMap?: InputMaybe<ModelStringInput>;
  or?: InputMaybe<Array<InputMaybe<ModelHikeFilterInput>>>;
  publicationState?: InputMaybe<ModelPublicationStateInput>;
  rate?: InputMaybe<ModelStringInput>;
  tags?: InputMaybe<ModelStringInput>;
}

export interface ModelIdInput {
  attributeExists?: InputMaybe<Scalars['Boolean']>;
  attributeType?: InputMaybe<ModelAttributeTypes>;
  beginsWith?: InputMaybe<Scalars['ID']>;
  between?: InputMaybe<Array<InputMaybe<Scalars['ID']>>>;
  contains?: InputMaybe<Scalars['ID']>;
  eq?: InputMaybe<Scalars['ID']>;
  ge?: InputMaybe<Scalars['ID']>;
  gt?: InputMaybe<Scalars['ID']>;
  le?: InputMaybe<Scalars['ID']>;
  lt?: InputMaybe<Scalars['ID']>;
  ne?: InputMaybe<Scalars['ID']>;
  notContains?: InputMaybe<Scalars['ID']>;
  size?: InputMaybe<ModelSizeInput>;
}

export interface ModelIntInput {
  attributeExists?: InputMaybe<Scalars['Boolean']>;
  attributeType?: InputMaybe<ModelAttributeTypes>;
  between?: InputMaybe<Array<InputMaybe<Scalars['Int']>>>;
  eq?: InputMaybe<Scalars['Int']>;
  ge?: InputMaybe<Scalars['Int']>;
  gt?: InputMaybe<Scalars['Int']>;
  le?: InputMaybe<Scalars['Int']>;
  lt?: InputMaybe<Scalars['Int']>;
  ne?: InputMaybe<Scalars['Int']>;
}

export interface ModelPublicationStateInput {
  eq?: InputMaybe<PublicationState>;
  ne?: InputMaybe<PublicationState>;
}

export interface ModelSizeInput {
  between?: InputMaybe<Array<InputMaybe<Scalars['Int']>>>;
  eq?: InputMaybe<Scalars['Int']>;
  ge?: InputMaybe<Scalars['Int']>;
  gt?: InputMaybe<Scalars['Int']>;
  le?: InputMaybe<Scalars['Int']>;
  lt?: InputMaybe<Scalars['Int']>;
  ne?: InputMaybe<Scalars['Int']>;
}

export enum ModelSortDirection {
  asc = 'ASC',
  desc = 'DESC'
}

export interface ModelStringInput {
  attributeExists?: InputMaybe<Scalars['Boolean']>;
  attributeType?: InputMaybe<ModelAttributeTypes>;
  beginsWith?: InputMaybe<Scalars['String']>;
  between?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  contains?: InputMaybe<Scalars['String']>;
  eq?: InputMaybe<Scalars['String']>;
  ge?: InputMaybe<Scalars['String']>;
  gt?: InputMaybe<Scalars['String']>;
  le?: InputMaybe<Scalars['String']>;
  lt?: InputMaybe<Scalars['String']>;
  ne?: InputMaybe<Scalars['String']>;
  notContains?: InputMaybe<Scalars['String']>;
  size?: InputMaybe<ModelSizeInput>;
}

export interface Mutation {
  createHike?: Maybe<Hike>;
  deleteHike?: Maybe<Hike>;
  updateHike?: Maybe<Hike>;
}


export interface MutationCreateHikeArgs {
  condition?: InputMaybe<ModelHikeConditionInput>;
  input: CreateHikeInput;
}


export interface MutationDeleteHikeArgs {
  condition?: InputMaybe<ModelHikeConditionInput>;
  input: DeleteHikeInput;
}


export interface MutationUpdateHikeArgs {
  condition?: InputMaybe<ModelHikeConditionInput>;
  input: UpdateHikeInput;
}

export interface Node {
  id: Scalars['ID'];
  label?: Maybe<ValidDataLabels>;
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

export interface PoiInput {
  address?: InputMaybe<Scalars['String']>;
  description: Array<TextualDescriptionInput>;
  id?: InputMaybe<Scalars['ID']>;
  location: PointInput;
  openingHours?: InputMaybe<Scalars['String']>;
  phoneFloat?: InputMaybe<Scalars['String']>;
  sourceObject: Array<PoiSourceObjectInput>;
  tags?: InputMaybe<Array<Scalars['String']>>;
  types?: InputMaybe<Array<Scalars['String']>>;
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

export interface PoiSourceObjectInput {
  languageKey?: InputMaybe<Scalars['String']>;
  objectId: Scalars['String'];
  objectType: PoiSource;
  url?: InputMaybe<Scalars['String']>;
}

export interface Point {
  ele?: Maybe<Scalars['Float']>;
  lat: Scalars['Float'];
  lon: Scalars['Float'];
}

export interface PointInput {
  ele?: InputMaybe<Scalars['Float']>;
  lat: Scalars['Float'];
  lon: Scalars['Float'];
}

export enum PublicationState {
  archived = 'archived',
  draft = 'draft',
  published = 'published'
}

export interface Query {
  getHike?: Maybe<Hike>;
  getNode?: Maybe<Node>;
  listHikes?: Maybe<ModelHikeConnection>;
  syncHikes?: Maybe<ModelHikeConnection>;
}


export interface QueryGetHikeArgs {
  id: Scalars['ID'];
}


export interface QueryGetNodeArgs {
  input: GetNodeInput;
}


export interface QueryListHikesArgs {
  filter?: InputMaybe<ModelHikeFilterInput>;
  limit?: InputMaybe<Scalars['Int']>;
  nextToken?: InputMaybe<Scalars['String']>;
}


export interface QuerySyncHikesArgs {
  filter?: InputMaybe<ModelHikeFilterInput>;
  lastSync?: InputMaybe<Scalars['AWSTimestamp']>;
  limit?: InputMaybe<Scalars['Int']>;
  nextToken?: InputMaybe<Scalars['String']>;
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

export interface RouteDataInput {
  averageTime: Scalars['Int'];
  bigBuffer: Array<Array<Array<Scalars['Float']>>>;
  bounds: BoundingBoxInput;
  difficulty: Scalars['Int'];
  distance: Scalars['Int'];
  downhill: Scalars['Int'];
  isRoundTrip: Scalars['Boolean'];
  poiSearchBox: BoundingBoxInput;
  score: Scalars['Int'];
  smallBuffer: Array<Array<Array<Scalars['Float']>>>;
  track: Array<Array<Scalars['Float']>>;
  uphill: Scalars['Int'];
}

export interface Subscription {
  onCreateHike?: Maybe<Hike>;
  onDeleteHike?: Maybe<Hike>;
  onUpdateHike?: Maybe<Hike>;
}

export interface TextualDescription {
  fullDescription?: Maybe<Scalars['String']>;
  languageKey: Scalars['String'];
  summary?: Maybe<Scalars['String']>;
  title?: Maybe<Scalars['String']>;
  type: TextualDescriptionType;
}

export interface TextualDescriptionInput {
  fullDescription?: InputMaybe<Scalars['String']>;
  languageKey: Scalars['String'];
  summary?: InputMaybe<Scalars['String']>;
  title?: InputMaybe<Scalars['String']>;
  type: TextualDescriptionType;
}

export enum TextualDescriptionType {
  html = 'html',
  markdown = 'markdown'
}

export interface UpdateHikeInput {
  _version?: InputMaybe<Scalars['Int']>;
  checkpoints?: InputMaybe<Array<InputMaybe<PoiInput>>>;
  description?: InputMaybe<Array<TextualDescriptionInput>>;
  endPoint?: InputMaybe<PointInput>;
  featured?: InputMaybe<Scalars['Boolean']>;
  featuredStops?: InputMaybe<Array<InputMaybe<HikeStopInput>>>;
  id: Scalars['ID'];
  location?: InputMaybe<Scalars['String']>;
  offlineMap?: InputMaybe<Scalars['String']>;
  publicationState?: InputMaybe<PublicationState>;
  rate?: InputMaybe<Scalars['String']>;
  route?: InputMaybe<RouteDataInput>;
  startPoint?: InputMaybe<PointInput>;
  tags?: InputMaybe<Array<Scalars['String']>>;
}

export enum ValidDataLabels {
  hike = 'Hike'
}

export type CreateHikeMutationVariables = Exact<{
  input: CreateHikeInput;
  condition?: InputMaybe<ModelHikeConditionInput>;
}>;


export type CreateHikeMutation = { createHike?: { id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean, bounds: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } }, poiSearchBox: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } } }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } } | null | undefined };

export type UpdateHikeMutationVariables = Exact<{
  input: UpdateHikeInput;
  condition?: InputMaybe<ModelHikeConditionInput>;
}>;


export type UpdateHikeMutation = { updateHike?: { id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean, bounds: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } }, poiSearchBox: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } } }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } } | null | undefined };

export type DeleteHikeMutationVariables = Exact<{
  input: DeleteHikeInput;
  condition?: InputMaybe<ModelHikeConditionInput>;
}>;


export type DeleteHikeMutation = { deleteHike?: { id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean, bounds: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } }, poiSearchBox: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } } }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } } | null | undefined };

export type GetNodeQueryVariables = Exact<{
  input: GetNodeInput;
}>;


export type GetNodeQuery = { getNode?: never | null | undefined };

export type GetHikeQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type GetHikeQuery = { getHike?: { id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean, bounds: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } }, poiSearchBox: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } } }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } } | null | undefined };

export type ListHikesQueryVariables = Exact<{
  filter?: InputMaybe<ModelHikeFilterInput>;
  limit?: InputMaybe<Scalars['Int']>;
  nextToken?: InputMaybe<Scalars['String']>;
}>;


export type ListHikesQuery = { listHikes?: { nextToken?: string | null | undefined, startedAt?: unknown | null | undefined, items: Array<{ id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } }> } | null | undefined };

export type SyncHikesQueryVariables = Exact<{
  filter?: InputMaybe<ModelHikeFilterInput>;
  limit?: InputMaybe<Scalars['Int']>;
  nextToken?: InputMaybe<Scalars['String']>;
  lastSync?: InputMaybe<Scalars['AWSTimestamp']>;
}>;


export type SyncHikesQuery = { syncHikes?: { nextToken?: string | null | undefined, startedAt?: unknown | null | undefined, items: Array<{ id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } }> } | null | undefined };

export type OnCreateHikeSubscriptionVariables = Exact<{ [key: string]: never; }>;


export type OnCreateHikeSubscription = { onCreateHike?: { id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean, bounds: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } }, poiSearchBox: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } } }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } } | null | undefined };

export type OnUpdateHikeSubscriptionVariables = Exact<{ [key: string]: never; }>;


export type OnUpdateHikeSubscription = { onUpdateHike?: { id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean, bounds: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } }, poiSearchBox: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } } }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } } | null | undefined };

export type OnDeleteHikeSubscriptionVariables = Exact<{ [key: string]: never; }>;


export type OnDeleteHikeSubscription = { onDeleteHike?: { id: string, location: string, publicationState: PublicationState, featured?: boolean | null | undefined, rate?: string | null | undefined, offlineMap?: string | null | undefined, tags?: Array<string> | null | undefined, createdAt: string, updatedAt: string, _version: number, _deleted?: boolean | null | undefined, _lastChangedAt: unknown, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, featuredStops?: Array<{ poiId: string, description?: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }> | null | undefined } | null | undefined> | null | undefined, checkpoints?: Array<{ id: string, types?: Array<string> | null | undefined, tags?: Array<string> | null | undefined, address?: string | null | undefined, phoneFloat?: string | null | undefined, openingHours?: string | null | undefined, location: { lat: number, lon: number, ele?: number | null | undefined }, description: Array<{ languageKey: string, title?: string | null | undefined, summary?: string | null | undefined, fullDescription?: string | null | undefined, type: TextualDescriptionType }>, sourceObject: Array<{ objectType: PoiSource, languageKey?: string | null | undefined, objectId: string, url?: string | null | undefined }> } | null | undefined> | null | undefined, route: { distance: number, uphill: number, downhill: number, track: Array<Array<number>>, bigBuffer: Array<Array<Array<number>>>, smallBuffer: Array<Array<Array<number>>>, averageTime: number, score: number, difficulty: number, isRoundTrip: boolean, bounds: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } }, poiSearchBox: { NorthEast: { lat: number, lon: number, ele?: number | null | undefined }, SouthWest: { lat: number, lon: number, ele?: number | null | undefined } } }, startPoint: { lat: number, lon: number, ele?: number | null | undefined }, endPoint: { lat: number, lon: number, ele?: number | null | undefined } } | null | undefined };


export const CreateHikeDocument = gql`
    mutation CreateHike($input: CreateHikeInput!, $condition: ModelHikeConditionInput) {
  createHike(input: $input, condition: $condition) {
    id
    description {
      languageKey
      title
      summary
      fullDescription
      type
    }
    location
    publicationState
    featured
    rate
    offlineMap
    featuredStops {
      poiId
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
    }
    checkpoints {
      id
      location {
        lat
        lon
        ele
      }
      types
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      tags
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      address
      phoneFloat
      openingHours
    }
    tags
    route {
      distance
      uphill
      downhill
      track
      bigBuffer
      smallBuffer
      averageTime
      score
      difficulty
      bounds {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
      isRoundTrip
      poiSearchBox {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
    }
    startPoint {
      lat
      lon
      ele
    }
    endPoint {
      lat
      lon
      ele
    }
    createdAt
    updatedAt
    _version
    _deleted
    _lastChangedAt
  }
}
    `;
export const UpdateHikeDocument = gql`
    mutation UpdateHike($input: UpdateHikeInput!, $condition: ModelHikeConditionInput) {
  updateHike(input: $input, condition: $condition) {
    id
    description {
      languageKey
      title
      summary
      fullDescription
      type
    }
    location
    publicationState
    featured
    rate
    offlineMap
    featuredStops {
      poiId
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
    }
    checkpoints {
      id
      location {
        lat
        lon
        ele
      }
      types
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      tags
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      address
      phoneFloat
      openingHours
    }
    tags
    route {
      distance
      uphill
      downhill
      track
      bigBuffer
      smallBuffer
      averageTime
      score
      difficulty
      bounds {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
      isRoundTrip
      poiSearchBox {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
    }
    startPoint {
      lat
      lon
      ele
    }
    endPoint {
      lat
      lon
      ele
    }
    createdAt
    updatedAt
    _version
    _deleted
    _lastChangedAt
  }
}
    `;
export const DeleteHikeDocument = gql`
    mutation DeleteHike($input: DeleteHikeInput!, $condition: ModelHikeConditionInput) {
  deleteHike(input: $input, condition: $condition) {
    id
    description {
      languageKey
      title
      summary
      fullDescription
      type
    }
    location
    publicationState
    featured
    rate
    offlineMap
    featuredStops {
      poiId
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
    }
    checkpoints {
      id
      location {
        lat
        lon
        ele
      }
      types
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      tags
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      address
      phoneFloat
      openingHours
    }
    tags
    route {
      distance
      uphill
      downhill
      track
      bigBuffer
      smallBuffer
      averageTime
      score
      difficulty
      bounds {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
      isRoundTrip
      poiSearchBox {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
    }
    startPoint {
      lat
      lon
      ele
    }
    endPoint {
      lat
      lon
      ele
    }
    createdAt
    updatedAt
    _version
    _deleted
    _lastChangedAt
  }
}
    `;
export const GetNodeDocument = gql`
    query GetNode($input: GetNodeInput!) {
  getNode(input: $input) {
    id
    label
  }
}
    `;
export const GetHikeDocument = gql`
    query GetHike($id: ID!) {
  getHike(id: $id) {
    id
    description {
      languageKey
      title
      summary
      fullDescription
      type
    }
    location
    publicationState
    featured
    rate
    offlineMap
    featuredStops {
      poiId
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
    }
    checkpoints {
      id
      location {
        lat
        lon
        ele
      }
      types
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      tags
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      address
      phoneFloat
      openingHours
    }
    tags
    route {
      distance
      uphill
      downhill
      track
      bigBuffer
      smallBuffer
      averageTime
      score
      difficulty
      bounds {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
      isRoundTrip
      poiSearchBox {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
    }
    startPoint {
      lat
      lon
      ele
    }
    endPoint {
      lat
      lon
      ele
    }
    createdAt
    updatedAt
    _version
    _deleted
    _lastChangedAt
  }
}
    `;
export const ListHikesDocument = gql`
    query ListHikes($filter: ModelHikeFilterInput, $limit: Int, $nextToken: String) {
  listHikes(filter: $filter, limit: $limit, nextToken: $nextToken) {
    items {
      id
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      location
      publicationState
      featured
      rate
      offlineMap
      featuredStops {
        poiId
        description {
          languageKey
          title
          summary
          fullDescription
          type
        }
      }
      checkpoints {
        id
        location {
          lat
          lon
          ele
        }
        types
        description {
          languageKey
          title
          summary
          fullDescription
          type
        }
        tags
        sourceObject {
          objectType
          languageKey
          objectId
          url
        }
        address
        phoneFloat
        openingHours
      }
      tags
      route {
        distance
        uphill
        downhill
        track
        bigBuffer
        smallBuffer
        averageTime
        score
        difficulty
        isRoundTrip
      }
      startPoint {
        lat
        lon
        ele
      }
      endPoint {
        lat
        lon
        ele
      }
      createdAt
      updatedAt
      _version
      _deleted
      _lastChangedAt
    }
    nextToken
    startedAt
  }
}
    `;
export const SyncHikesDocument = gql`
    query SyncHikes($filter: ModelHikeFilterInput, $limit: Int, $nextToken: String, $lastSync: AWSTimestamp) {
  syncHikes(
    filter: $filter
    limit: $limit
    nextToken: $nextToken
    lastSync: $lastSync
  ) {
    items {
      id
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      location
      publicationState
      featured
      rate
      offlineMap
      featuredStops {
        poiId
        description {
          languageKey
          title
          summary
          fullDescription
          type
        }
      }
      checkpoints {
        id
        location {
          lat
          lon
          ele
        }
        types
        description {
          languageKey
          title
          summary
          fullDescription
          type
        }
        tags
        sourceObject {
          objectType
          languageKey
          objectId
          url
        }
        address
        phoneFloat
        openingHours
      }
      tags
      route {
        distance
        uphill
        downhill
        track
        bigBuffer
        smallBuffer
        averageTime
        score
        difficulty
        isRoundTrip
      }
      startPoint {
        lat
        lon
        ele
      }
      endPoint {
        lat
        lon
        ele
      }
      createdAt
      updatedAt
      _version
      _deleted
      _lastChangedAt
    }
    nextToken
    startedAt
  }
}
    `;
export const OnCreateHikeDocument = gql`
    subscription OnCreateHike {
  onCreateHike {
    id
    description {
      languageKey
      title
      summary
      fullDescription
      type
    }
    location
    publicationState
    featured
    rate
    offlineMap
    featuredStops {
      poiId
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
    }
    checkpoints {
      id
      location {
        lat
        lon
        ele
      }
      types
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      tags
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      address
      phoneFloat
      openingHours
    }
    tags
    route {
      distance
      uphill
      downhill
      track
      bigBuffer
      smallBuffer
      averageTime
      score
      difficulty
      bounds {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
      isRoundTrip
      poiSearchBox {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
    }
    startPoint {
      lat
      lon
      ele
    }
    endPoint {
      lat
      lon
      ele
    }
    createdAt
    updatedAt
    _version
    _deleted
    _lastChangedAt
  }
}
    `;
export const OnUpdateHikeDocument = gql`
    subscription OnUpdateHike {
  onUpdateHike {
    id
    description {
      languageKey
      title
      summary
      fullDescription
      type
    }
    location
    publicationState
    featured
    rate
    offlineMap
    featuredStops {
      poiId
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
    }
    checkpoints {
      id
      location {
        lat
        lon
        ele
      }
      types
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      tags
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      address
      phoneFloat
      openingHours
    }
    tags
    route {
      distance
      uphill
      downhill
      track
      bigBuffer
      smallBuffer
      averageTime
      score
      difficulty
      bounds {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
      isRoundTrip
      poiSearchBox {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
    }
    startPoint {
      lat
      lon
      ele
    }
    endPoint {
      lat
      lon
      ele
    }
    createdAt
    updatedAt
    _version
    _deleted
    _lastChangedAt
  }
}
    `;
export const OnDeleteHikeDocument = gql`
    subscription OnDeleteHike {
  onDeleteHike {
    id
    description {
      languageKey
      title
      summary
      fullDescription
      type
    }
    location
    publicationState
    featured
    rate
    offlineMap
    featuredStops {
      poiId
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
    }
    checkpoints {
      id
      location {
        lat
        lon
        ele
      }
      types
      description {
        languageKey
        title
        summary
        fullDescription
        type
      }
      tags
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      address
      phoneFloat
      openingHours
    }
    tags
    route {
      distance
      uphill
      downhill
      track
      bigBuffer
      smallBuffer
      averageTime
      score
      difficulty
      bounds {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
      isRoundTrip
      poiSearchBox {
        NorthEast {
          lat
          lon
          ele
        }
        SouthWest {
          lat
          lon
          ele
        }
      }
    }
    startPoint {
      lat
      lon
      ele
    }
    endPoint {
      lat
      lon
      ele
    }
    createdAt
    updatedAt
    _version
    _deleted
    _lastChangedAt
  }
}
    `;
export type Requester<C= {}> = <R, V>(doc: DocumentNode, vars?: V, options?: C) => Promise<R> & Observable<R>
export function getSdk<C>(requester: Requester<C>) {
  return {
    CreateHike(variables: CreateHikeMutationVariables, options?: C): Promise<CreateHikeMutation> {
      return requester<CreateHikeMutation, CreateHikeMutationVariables>(CreateHikeDocument, variables, options);
    },
    UpdateHike(variables: UpdateHikeMutationVariables, options?: C): Promise<UpdateHikeMutation> {
      return requester<UpdateHikeMutation, UpdateHikeMutationVariables>(UpdateHikeDocument, variables, options);
    },
    DeleteHike(variables: DeleteHikeMutationVariables, options?: C): Promise<DeleteHikeMutation> {
      return requester<DeleteHikeMutation, DeleteHikeMutationVariables>(DeleteHikeDocument, variables, options);
    },
    GetNode(variables: GetNodeQueryVariables, options?: C): Promise<GetNodeQuery> {
      return requester<GetNodeQuery, GetNodeQueryVariables>(GetNodeDocument, variables, options);
    },
    GetHike(variables: GetHikeQueryVariables, options?: C): Promise<GetHikeQuery> {
      return requester<GetHikeQuery, GetHikeQueryVariables>(GetHikeDocument, variables, options);
    },
    ListHikes(variables?: ListHikesQueryVariables, options?: C): Promise<ListHikesQuery> {
      return requester<ListHikesQuery, ListHikesQueryVariables>(ListHikesDocument, variables, options);
    },
    SyncHikes(variables?: SyncHikesQueryVariables, options?: C): Promise<SyncHikesQuery> {
      return requester<SyncHikesQuery, SyncHikesQueryVariables>(SyncHikesDocument, variables, options);
    },
    OnCreateHike(variables?: OnCreateHikeSubscriptionVariables, options?: C): Observable<OnCreateHikeSubscription> {
      return requester<OnCreateHikeSubscription, OnCreateHikeSubscriptionVariables>(OnCreateHikeDocument, variables, options);
    },
    OnUpdateHike(variables?: OnUpdateHikeSubscriptionVariables, options?: C): Observable<OnUpdateHikeSubscription> {
      return requester<OnUpdateHikeSubscription, OnUpdateHikeSubscriptionVariables>(OnUpdateHikeDocument, variables, options);
    },
    OnDeleteHike(variables?: OnDeleteHikeSubscriptionVariables, options?: C): Observable<OnDeleteHikeSubscription> {
      return requester<OnDeleteHikeSubscription, OnDeleteHikeSubscriptionVariables>(OnDeleteHikeDocument, variables, options);
    }
  };
}
export type Sdk = ReturnType<typeof getSdk>;