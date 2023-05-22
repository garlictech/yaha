import { Observable } from 'rxjs';
import { DocumentNode } from 'graphql';
import gql from 'graphql-tag';
import { OperationVariables } from 'apollo-client';
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = {
  [K in keyof T]: T[K];
};
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & {
  [SubKey in K]?: Maybe<T[SubKey]>;
};
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & {
  [SubKey in K]: Maybe<T[SubKey]>;
};
/** All built-in and custom scalars, mapped to their actual values */
export interface Scalars {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
}

export interface CreateCustomersMutationResponse {
  customers: Array<Customer>;
  info: CreateInfo;
}

export interface CreateDescriptionsMutationResponse {
  descriptions: Array<Description>;
  info: CreateInfo;
}

export interface CreateHikesMutationResponse {
  hikes: Array<Hike>;
  info: CreateInfo;
}

export interface CreateImagesMutationResponse {
  images: Array<Image>;
  info: CreateInfo;
}

export interface CreateInfo {
  bookmark?: Maybe<Scalars['String']>;
  nodesCreated: Scalars['Int'];
  relationshipsCreated: Scalars['Int'];
}

export interface CreatePoisMutationResponse {
  info: CreateInfo;
  pois: Array<Poi>;
}

export interface CreateProfilesMutationResponse {
  info: CreateInfo;
  profiles: Array<Profile>;
}

export interface CreateRoutesMutationResponse {
  info: CreateInfo;
  routes: Array<Route>;
}

export interface CreateSettingsMutationResponse {
  info: CreateInfo;
  settings: Array<Settings>;
}

export interface CreateTypeWithPointsMutationResponse {
  info: CreateInfo;
  typeWithPoints: Array<TypeWithPoint>;
}

export interface CreateWaypointsMutationResponse {
  info: CreateInfo;
  waypoints: Array<Waypoint>;
}

export interface Customer {
  bookmarkedHikes?: Maybe<Array<Maybe<Scalars['ID']>>>;
  profile?: Maybe<Profile>;
  settings?: Maybe<Settings>;
}

export interface CustomerAggregateSelection {
  count: Scalars['Int'];
}

export interface CustomerCreateInput {
  bookmarkedHikes?: InputMaybe<Array<InputMaybe<Scalars['ID']>>>;
}

export interface CustomerEdge {
  cursor: Scalars['String'];
  node: Customer;
}

export interface CustomerOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
}

export interface CustomerUpdateInput {
  bookmarkedHikes?: InputMaybe<Array<InputMaybe<Scalars['ID']>>>;
  bookmarkedHikes_POP?: InputMaybe<Scalars['Int']>;
  bookmarkedHikes_PUSH?: InputMaybe<Array<InputMaybe<Scalars['ID']>>>;
}

export interface CustomerWhere {
  AND?: InputMaybe<Array<CustomerWhere>>;
  NOT?: InputMaybe<CustomerWhere>;
  OR?: InputMaybe<Array<CustomerWhere>>;
  bookmarkedHikes?: InputMaybe<Array<InputMaybe<Scalars['ID']>>>;
  bookmarkedHikes_INCLUDES?: InputMaybe<Scalars['ID']>;
}

export interface CustomersConnection {
  edges: Array<CustomerEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface DeleteInfo {
  bookmark?: Maybe<Scalars['String']>;
  nodesDeleted: Scalars['Int'];
  relationshipsDeleted: Scalars['Int'];
}

export interface Description {
  fullDescription?: Maybe<Scalars['String']>;
  languageKey: Scalars['String'];
  summary?: Maybe<Scalars['String']>;
  title?: Maybe<Scalars['String']>;
  type: DescriptionType;
}

export interface DescriptionAggregateSelection {
  count: Scalars['Int'];
  fullDescription: StringAggregateSelectionNullable;
  languageKey: StringAggregateSelectionNonNullable;
  summary: StringAggregateSelectionNullable;
  title: StringAggregateSelectionNullable;
}

export interface DescriptionConnectWhere {
  node: DescriptionWhere;
}

export interface DescriptionCreateInput {
  fullDescription?: InputMaybe<Scalars['String']>;
  languageKey: Scalars['String'];
  summary?: InputMaybe<Scalars['String']>;
  title?: InputMaybe<Scalars['String']>;
  type: DescriptionType;
}

export interface DescriptionEdge {
  cursor: Scalars['String'];
  node: Description;
}

export interface DescriptionOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more DescriptionSort objects to sort Descriptions by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<DescriptionSort>>;
}

/** Fields to sort Descriptions by. The order in which sorts are applied is not guaranteed when specifying many fields in one DescriptionSort object. */
export interface DescriptionSort {
  fullDescription?: InputMaybe<SortDirection>;
  languageKey?: InputMaybe<SortDirection>;
  summary?: InputMaybe<SortDirection>;
  title?: InputMaybe<SortDirection>;
  type?: InputMaybe<SortDirection>;
}

export enum DescriptionType {
  html = 'html',
  markdown = 'markdown',
  plaintext = 'plaintext',
}

export interface DescriptionUpdateInput {
  fullDescription?: InputMaybe<Scalars['String']>;
  languageKey?: InputMaybe<Scalars['String']>;
  summary?: InputMaybe<Scalars['String']>;
  title?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<DescriptionType>;
}

export interface DescriptionWhere {
  AND?: InputMaybe<Array<DescriptionWhere>>;
  NOT?: InputMaybe<DescriptionWhere>;
  OR?: InputMaybe<Array<DescriptionWhere>>;
  fullDescription?: InputMaybe<Scalars['String']>;
  fullDescription_CONTAINS?: InputMaybe<Scalars['String']>;
  fullDescription_ENDS_WITH?: InputMaybe<Scalars['String']>;
  fullDescription_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  fullDescription_STARTS_WITH?: InputMaybe<Scalars['String']>;
  languageKey?: InputMaybe<Scalars['String']>;
  languageKey_CONTAINS?: InputMaybe<Scalars['String']>;
  languageKey_ENDS_WITH?: InputMaybe<Scalars['String']>;
  languageKey_IN?: InputMaybe<Array<Scalars['String']>>;
  languageKey_STARTS_WITH?: InputMaybe<Scalars['String']>;
  summary?: InputMaybe<Scalars['String']>;
  summary_CONTAINS?: InputMaybe<Scalars['String']>;
  summary_ENDS_WITH?: InputMaybe<Scalars['String']>;
  summary_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  summary_STARTS_WITH?: InputMaybe<Scalars['String']>;
  title?: InputMaybe<Scalars['String']>;
  title_CONTAINS?: InputMaybe<Scalars['String']>;
  title_ENDS_WITH?: InputMaybe<Scalars['String']>;
  title_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  title_STARTS_WITH?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<DescriptionType>;
  type_IN?: InputMaybe<Array<DescriptionType>>;
}

export interface DescriptionsConnection {
  edges: Array<DescriptionEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface Hike {
  descriptions: Array<Description>;
  descriptionsAggregate?: Maybe<HikeDescriptionDescriptionsAggregationSelection>;
  descriptionsConnection: HikeDescriptionsConnection;
  featured?: Maybe<Scalars['Boolean']>;
  id?: Maybe<Scalars['String']>;
  publicationState?: Maybe<PublicationState>;
  rate?: Maybe<Scalars['String']>;
  route: Route;
  routeAggregate?: Maybe<HikeRouteRouteAggregationSelection>;
  routeConnection: HikeRouteConnection;
  tags?: Maybe<Array<Maybe<Scalars['String']>>>;
}

export interface HikeDescriptionsArgs {
  directed?: InputMaybe<Scalars['Boolean']>;
  options?: InputMaybe<DescriptionOptions>;
  where?: InputMaybe<DescriptionWhere>;
}

export interface HikeDescriptionsAggregateArgs {
  directed?: InputMaybe<Scalars['Boolean']>;
  where?: InputMaybe<DescriptionWhere>;
}

export interface HikeDescriptionsConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  directed?: InputMaybe<Scalars['Boolean']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<HikeDescriptionsConnectionSort>>;
  where?: InputMaybe<HikeDescriptionsConnectionWhere>;
}

export interface HikeRouteArgs {
  directed?: InputMaybe<Scalars['Boolean']>;
  options?: InputMaybe<RouteOptions>;
  where?: InputMaybe<RouteWhere>;
}

export interface HikeRouteAggregateArgs {
  directed?: InputMaybe<Scalars['Boolean']>;
  where?: InputMaybe<RouteWhere>;
}

export interface HikeRouteConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  directed?: InputMaybe<Scalars['Boolean']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<HikeRouteConnectionSort>>;
  where?: InputMaybe<HikeRouteConnectionWhere>;
}

export interface HikeAggregateSelection {
  count: Scalars['Int'];
  id: StringAggregateSelectionNullable;
  rate: StringAggregateSelectionNullable;
}

export interface HikeConnectInput {
  descriptions?: InputMaybe<Array<HikeDescriptionsConnectFieldInput>>;
  route?: InputMaybe<HikeRouteConnectFieldInput>;
}

export interface HikeCreateInput {
  descriptions?: InputMaybe<HikeDescriptionsFieldInput>;
  featured?: InputMaybe<Scalars['Boolean']>;
  id?: InputMaybe<Scalars['String']>;
  publicationState?: InputMaybe<PublicationState>;
  rate?: InputMaybe<Scalars['String']>;
  route?: InputMaybe<HikeRouteFieldInput>;
  tags?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
}

export interface HikeDeleteInput {
  descriptions?: InputMaybe<Array<HikeDescriptionsDeleteFieldInput>>;
  route?: InputMaybe<HikeRouteDeleteFieldInput>;
}

export interface HikeDescriptionDescriptionsAggregationSelection {
  count: Scalars['Int'];
  node?: Maybe<HikeDescriptionDescriptionsNodeAggregateSelection>;
}

export interface HikeDescriptionDescriptionsNodeAggregateSelection {
  fullDescription: StringAggregateSelectionNullable;
  languageKey: StringAggregateSelectionNonNullable;
  summary: StringAggregateSelectionNullable;
  title: StringAggregateSelectionNullable;
}

export interface HikeDescriptionsAggregateInput {
  AND?: InputMaybe<Array<HikeDescriptionsAggregateInput>>;
  NOT?: InputMaybe<HikeDescriptionsAggregateInput>;
  OR?: InputMaybe<Array<HikeDescriptionsAggregateInput>>;
  count?: InputMaybe<Scalars['Int']>;
  count_GT?: InputMaybe<Scalars['Int']>;
  count_GTE?: InputMaybe<Scalars['Int']>;
  count_LT?: InputMaybe<Scalars['Int']>;
  count_LTE?: InputMaybe<Scalars['Int']>;
  node?: InputMaybe<HikeDescriptionsNodeAggregationWhereInput>;
}

export interface HikeDescriptionsConnectFieldInput {
  /** Whether or not to overwrite any matching relationship with the new properties. Will default to `false` in 4.0.0. */
  overwrite?: Scalars['Boolean'];
  where?: InputMaybe<DescriptionConnectWhere>;
}

export interface HikeDescriptionsConnection {
  edges: Array<HikeDescriptionsRelationship>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface HikeDescriptionsConnectionSort {
  node?: InputMaybe<DescriptionSort>;
}

export interface HikeDescriptionsConnectionWhere {
  AND?: InputMaybe<Array<HikeDescriptionsConnectionWhere>>;
  NOT?: InputMaybe<HikeDescriptionsConnectionWhere>;
  OR?: InputMaybe<Array<HikeDescriptionsConnectionWhere>>;
  node?: InputMaybe<DescriptionWhere>;
}

export interface HikeDescriptionsCreateFieldInput {
  node: DescriptionCreateInput;
}

export interface HikeDescriptionsDeleteFieldInput {
  where?: InputMaybe<HikeDescriptionsConnectionWhere>;
}

export interface HikeDescriptionsDisconnectFieldInput {
  where?: InputMaybe<HikeDescriptionsConnectionWhere>;
}

export interface HikeDescriptionsFieldInput {
  connect?: InputMaybe<Array<HikeDescriptionsConnectFieldInput>>;
  create?: InputMaybe<Array<HikeDescriptionsCreateFieldInput>>;
}

export interface HikeDescriptionsNodeAggregationWhereInput {
  AND?: InputMaybe<Array<HikeDescriptionsNodeAggregationWhereInput>>;
  NOT?: InputMaybe<HikeDescriptionsNodeAggregationWhereInput>;
  OR?: InputMaybe<Array<HikeDescriptionsNodeAggregationWhereInput>>;
  fullDescription_AVERAGE_LENGTH_EQUAL?: InputMaybe<Scalars['Float']>;
  fullDescription_AVERAGE_LENGTH_GT?: InputMaybe<Scalars['Float']>;
  fullDescription_AVERAGE_LENGTH_GTE?: InputMaybe<Scalars['Float']>;
  fullDescription_AVERAGE_LENGTH_LT?: InputMaybe<Scalars['Float']>;
  fullDescription_AVERAGE_LENGTH_LTE?: InputMaybe<Scalars['Float']>;
  fullDescription_LONGEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  fullDescription_LONGEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  fullDescription_LONGEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  fullDescription_LONGEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  fullDescription_LONGEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  fullDescription_SHORTEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  fullDescription_SHORTEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  fullDescription_SHORTEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  fullDescription_SHORTEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  fullDescription_SHORTEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  languageKey_AVERAGE_LENGTH_EQUAL?: InputMaybe<Scalars['Float']>;
  languageKey_AVERAGE_LENGTH_GT?: InputMaybe<Scalars['Float']>;
  languageKey_AVERAGE_LENGTH_GTE?: InputMaybe<Scalars['Float']>;
  languageKey_AVERAGE_LENGTH_LT?: InputMaybe<Scalars['Float']>;
  languageKey_AVERAGE_LENGTH_LTE?: InputMaybe<Scalars['Float']>;
  languageKey_LONGEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  languageKey_LONGEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  languageKey_LONGEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  languageKey_LONGEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  languageKey_LONGEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  languageKey_SHORTEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  languageKey_SHORTEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  languageKey_SHORTEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  languageKey_SHORTEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  languageKey_SHORTEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  summary_AVERAGE_LENGTH_EQUAL?: InputMaybe<Scalars['Float']>;
  summary_AVERAGE_LENGTH_GT?: InputMaybe<Scalars['Float']>;
  summary_AVERAGE_LENGTH_GTE?: InputMaybe<Scalars['Float']>;
  summary_AVERAGE_LENGTH_LT?: InputMaybe<Scalars['Float']>;
  summary_AVERAGE_LENGTH_LTE?: InputMaybe<Scalars['Float']>;
  summary_LONGEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  summary_LONGEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  summary_LONGEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  summary_LONGEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  summary_LONGEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  summary_SHORTEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  summary_SHORTEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  summary_SHORTEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  summary_SHORTEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  summary_SHORTEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  title_AVERAGE_LENGTH_EQUAL?: InputMaybe<Scalars['Float']>;
  title_AVERAGE_LENGTH_GT?: InputMaybe<Scalars['Float']>;
  title_AVERAGE_LENGTH_GTE?: InputMaybe<Scalars['Float']>;
  title_AVERAGE_LENGTH_LT?: InputMaybe<Scalars['Float']>;
  title_AVERAGE_LENGTH_LTE?: InputMaybe<Scalars['Float']>;
  title_LONGEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  title_LONGEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  title_LONGEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  title_LONGEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  title_LONGEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  title_SHORTEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  title_SHORTEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  title_SHORTEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  title_SHORTEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  title_SHORTEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
}

export interface HikeDescriptionsRelationship {
  cursor: Scalars['String'];
  node: Description;
}

export interface HikeDescriptionsUpdateConnectionInput {
  node?: InputMaybe<DescriptionUpdateInput>;
}

export interface HikeDescriptionsUpdateFieldInput {
  connect?: InputMaybe<Array<HikeDescriptionsConnectFieldInput>>;
  create?: InputMaybe<Array<HikeDescriptionsCreateFieldInput>>;
  delete?: InputMaybe<Array<HikeDescriptionsDeleteFieldInput>>;
  disconnect?: InputMaybe<Array<HikeDescriptionsDisconnectFieldInput>>;
  update?: InputMaybe<HikeDescriptionsUpdateConnectionInput>;
  where?: InputMaybe<HikeDescriptionsConnectionWhere>;
}

export interface HikeDisconnectInput {
  descriptions?: InputMaybe<Array<HikeDescriptionsDisconnectFieldInput>>;
  route?: InputMaybe<HikeRouteDisconnectFieldInput>;
}

export interface HikeEdge {
  cursor: Scalars['String'];
  node: Hike;
}

export interface HikeOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more HikeSort objects to sort Hikes by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<HikeSort>>;
}

export interface HikeRelationInput {
  descriptions?: InputMaybe<Array<HikeDescriptionsCreateFieldInput>>;
  route?: InputMaybe<HikeRouteCreateFieldInput>;
}

export interface HikeRouteAggregateInput {
  AND?: InputMaybe<Array<HikeRouteAggregateInput>>;
  NOT?: InputMaybe<HikeRouteAggregateInput>;
  OR?: InputMaybe<Array<HikeRouteAggregateInput>>;
  count?: InputMaybe<Scalars['Int']>;
  count_GT?: InputMaybe<Scalars['Int']>;
  count_GTE?: InputMaybe<Scalars['Int']>;
  count_LT?: InputMaybe<Scalars['Int']>;
  count_LTE?: InputMaybe<Scalars['Int']>;
  node?: InputMaybe<HikeRouteNodeAggregationWhereInput>;
}

export interface HikeRouteConnectFieldInput {
  /** Whether or not to overwrite any matching relationship with the new properties. Will default to `false` in 4.0.0. */
  overwrite?: Scalars['Boolean'];
  where?: InputMaybe<RouteConnectWhere>;
}

export interface HikeRouteConnection {
  edges: Array<HikeRouteRelationship>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface HikeRouteConnectionSort {
  node?: InputMaybe<RouteSort>;
}

export interface HikeRouteConnectionWhere {
  AND?: InputMaybe<Array<HikeRouteConnectionWhere>>;
  NOT?: InputMaybe<HikeRouteConnectionWhere>;
  OR?: InputMaybe<Array<HikeRouteConnectionWhere>>;
  node?: InputMaybe<RouteWhere>;
}

export interface HikeRouteCreateFieldInput {
  node: RouteCreateInput;
}

export interface HikeRouteDeleteFieldInput {
  where?: InputMaybe<HikeRouteConnectionWhere>;
}

export interface HikeRouteDisconnectFieldInput {
  where?: InputMaybe<HikeRouteConnectionWhere>;
}

export interface HikeRouteFieldInput {
  connect?: InputMaybe<HikeRouteConnectFieldInput>;
  create?: InputMaybe<HikeRouteCreateFieldInput>;
}

export interface HikeRouteNodeAggregationWhereInput {
  AND?: InputMaybe<Array<HikeRouteNodeAggregationWhereInput>>;
  NOT?: InputMaybe<HikeRouteNodeAggregationWhereInput>;
  OR?: InputMaybe<Array<HikeRouteNodeAggregationWhereInput>>;
  id_AVERAGE_LENGTH_EQUAL?: InputMaybe<Scalars['Float']>;
  id_AVERAGE_LENGTH_GT?: InputMaybe<Scalars['Float']>;
  id_AVERAGE_LENGTH_GTE?: InputMaybe<Scalars['Float']>;
  id_AVERAGE_LENGTH_LT?: InputMaybe<Scalars['Float']>;
  id_AVERAGE_LENGTH_LTE?: InputMaybe<Scalars['Float']>;
  id_LONGEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  id_LONGEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  id_LONGEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  id_LONGEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  id_LONGEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  id_SHORTEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  id_SHORTEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  id_SHORTEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  id_SHORTEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  id_SHORTEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  municipality_AVERAGE_LENGTH_EQUAL?: InputMaybe<Scalars['Float']>;
  municipality_AVERAGE_LENGTH_GT?: InputMaybe<Scalars['Float']>;
  municipality_AVERAGE_LENGTH_GTE?: InputMaybe<Scalars['Float']>;
  municipality_AVERAGE_LENGTH_LT?: InputMaybe<Scalars['Float']>;
  municipality_AVERAGE_LENGTH_LTE?: InputMaybe<Scalars['Float']>;
  municipality_LONGEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  municipality_LONGEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  municipality_LONGEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  municipality_LONGEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  municipality_LONGEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
  municipality_SHORTEST_LENGTH_EQUAL?: InputMaybe<Scalars['Int']>;
  municipality_SHORTEST_LENGTH_GT?: InputMaybe<Scalars['Int']>;
  municipality_SHORTEST_LENGTH_GTE?: InputMaybe<Scalars['Int']>;
  municipality_SHORTEST_LENGTH_LT?: InputMaybe<Scalars['Int']>;
  municipality_SHORTEST_LENGTH_LTE?: InputMaybe<Scalars['Int']>;
}

export interface HikeRouteRelationship {
  cursor: Scalars['String'];
  node: Route;
}

export interface HikeRouteRouteAggregationSelection {
  count: Scalars['Int'];
  node?: Maybe<HikeRouteRouteNodeAggregateSelection>;
}

export interface HikeRouteRouteNodeAggregateSelection {
  id: StringAggregateSelectionNullable;
  municipality: StringAggregateSelectionNullable;
}

export interface HikeRouteUpdateConnectionInput {
  node?: InputMaybe<RouteUpdateInput>;
}

export interface HikeRouteUpdateFieldInput {
  connect?: InputMaybe<HikeRouteConnectFieldInput>;
  create?: InputMaybe<HikeRouteCreateFieldInput>;
  delete?: InputMaybe<HikeRouteDeleteFieldInput>;
  disconnect?: InputMaybe<HikeRouteDisconnectFieldInput>;
  update?: InputMaybe<HikeRouteUpdateConnectionInput>;
  where?: InputMaybe<HikeRouteConnectionWhere>;
}

/** Fields to sort Hikes by. The order in which sorts are applied is not guaranteed when specifying many fields in one HikeSort object. */
export interface HikeSort {
  featured?: InputMaybe<SortDirection>;
  id?: InputMaybe<SortDirection>;
  publicationState?: InputMaybe<SortDirection>;
  rate?: InputMaybe<SortDirection>;
}

export interface HikeUpdateInput {
  descriptions?: InputMaybe<Array<HikeDescriptionsUpdateFieldInput>>;
  featured?: InputMaybe<Scalars['Boolean']>;
  id?: InputMaybe<Scalars['String']>;
  publicationState?: InputMaybe<PublicationState>;
  rate?: InputMaybe<Scalars['String']>;
  route?: InputMaybe<HikeRouteUpdateFieldInput>;
  tags?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  tags_POP?: InputMaybe<Scalars['Int']>;
  tags_PUSH?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
}

export interface HikeWhere {
  AND?: InputMaybe<Array<HikeWhere>>;
  NOT?: InputMaybe<HikeWhere>;
  OR?: InputMaybe<Array<HikeWhere>>;
  descriptionsAggregate?: InputMaybe<HikeDescriptionsAggregateInput>;
  /** Return Hikes where all of the related HikeDescriptionsConnections match this filter */
  descriptionsConnection_ALL?: InputMaybe<HikeDescriptionsConnectionWhere>;
  /** Return Hikes where none of the related HikeDescriptionsConnections match this filter */
  descriptionsConnection_NONE?: InputMaybe<HikeDescriptionsConnectionWhere>;
  /** Return Hikes where one of the related HikeDescriptionsConnections match this filter */
  descriptionsConnection_SINGLE?: InputMaybe<HikeDescriptionsConnectionWhere>;
  /** Return Hikes where some of the related HikeDescriptionsConnections match this filter */
  descriptionsConnection_SOME?: InputMaybe<HikeDescriptionsConnectionWhere>;
  /** Return Hikes where all of the related Descriptions match this filter */
  descriptions_ALL?: InputMaybe<DescriptionWhere>;
  /** Return Hikes where none of the related Descriptions match this filter */
  descriptions_NONE?: InputMaybe<DescriptionWhere>;
  /** Return Hikes where one of the related Descriptions match this filter */
  descriptions_SINGLE?: InputMaybe<DescriptionWhere>;
  /** Return Hikes where some of the related Descriptions match this filter */
  descriptions_SOME?: InputMaybe<DescriptionWhere>;
  featured?: InputMaybe<Scalars['Boolean']>;
  id?: InputMaybe<Scalars['String']>;
  id_CONTAINS?: InputMaybe<Scalars['String']>;
  id_ENDS_WITH?: InputMaybe<Scalars['String']>;
  id_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  id_STARTS_WITH?: InputMaybe<Scalars['String']>;
  publicationState?: InputMaybe<PublicationState>;
  publicationState_IN?: InputMaybe<Array<InputMaybe<PublicationState>>>;
  rate?: InputMaybe<Scalars['String']>;
  rate_CONTAINS?: InputMaybe<Scalars['String']>;
  rate_ENDS_WITH?: InputMaybe<Scalars['String']>;
  rate_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  rate_STARTS_WITH?: InputMaybe<Scalars['String']>;
  route?: InputMaybe<RouteWhere>;
  routeAggregate?: InputMaybe<HikeRouteAggregateInput>;
  routeConnection?: InputMaybe<HikeRouteConnectionWhere>;
  routeConnection_NOT?: InputMaybe<HikeRouteConnectionWhere>;
  route_NOT?: InputMaybe<RouteWhere>;
  tags?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  tags_INCLUDES?: InputMaybe<Scalars['String']>;
}

export interface HikesConnection {
  edges: Array<HikeEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface Image {
  attributions?: Maybe<Scalars['String']>;
  banned?: Maybe<Scalars['Boolean']>;
  card: Scalars['String'];
  id: Scalars['String'];
  labels?: Maybe<Array<Maybe<Scalars['String']>>>;
  original: Scalars['String'];
  tagged?: Maybe<Scalars['Boolean']>;
  thumbnail: Scalars['String'];
}

export interface ImageAggregateSelection {
  attributions: StringAggregateSelectionNullable;
  card: StringAggregateSelectionNonNullable;
  count: Scalars['Int'];
  id: StringAggregateSelectionNonNullable;
  original: StringAggregateSelectionNonNullable;
  thumbnail: StringAggregateSelectionNonNullable;
}

export interface ImageCreateInput {
  attributions?: InputMaybe<Scalars['String']>;
  banned?: InputMaybe<Scalars['Boolean']>;
  card: Scalars['String'];
  id: Scalars['String'];
  labels?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  original: Scalars['String'];
  tagged?: InputMaybe<Scalars['Boolean']>;
  thumbnail: Scalars['String'];
}

export interface ImageEdge {
  cursor: Scalars['String'];
  node: Image;
}

export interface ImageOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more ImageSort objects to sort Images by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<ImageSort>>;
}

/** Fields to sort Images by. The order in which sorts are applied is not guaranteed when specifying many fields in one ImageSort object. */
export interface ImageSort {
  attributions?: InputMaybe<SortDirection>;
  banned?: InputMaybe<SortDirection>;
  card?: InputMaybe<SortDirection>;
  id?: InputMaybe<SortDirection>;
  original?: InputMaybe<SortDirection>;
  tagged?: InputMaybe<SortDirection>;
  thumbnail?: InputMaybe<SortDirection>;
}

export interface ImageUpdateInput {
  attributions?: InputMaybe<Scalars['String']>;
  banned?: InputMaybe<Scalars['Boolean']>;
  card?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['String']>;
  labels?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  labels_POP?: InputMaybe<Scalars['Int']>;
  labels_PUSH?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  original?: InputMaybe<Scalars['String']>;
  tagged?: InputMaybe<Scalars['Boolean']>;
  thumbnail?: InputMaybe<Scalars['String']>;
}

export interface ImageWhere {
  AND?: InputMaybe<Array<ImageWhere>>;
  NOT?: InputMaybe<ImageWhere>;
  OR?: InputMaybe<Array<ImageWhere>>;
  attributions?: InputMaybe<Scalars['String']>;
  attributions_CONTAINS?: InputMaybe<Scalars['String']>;
  attributions_ENDS_WITH?: InputMaybe<Scalars['String']>;
  attributions_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  attributions_STARTS_WITH?: InputMaybe<Scalars['String']>;
  banned?: InputMaybe<Scalars['Boolean']>;
  card?: InputMaybe<Scalars['String']>;
  card_CONTAINS?: InputMaybe<Scalars['String']>;
  card_ENDS_WITH?: InputMaybe<Scalars['String']>;
  card_IN?: InputMaybe<Array<Scalars['String']>>;
  card_STARTS_WITH?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['String']>;
  id_CONTAINS?: InputMaybe<Scalars['String']>;
  id_ENDS_WITH?: InputMaybe<Scalars['String']>;
  id_IN?: InputMaybe<Array<Scalars['String']>>;
  id_STARTS_WITH?: InputMaybe<Scalars['String']>;
  labels?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  labels_INCLUDES?: InputMaybe<Scalars['String']>;
  original?: InputMaybe<Scalars['String']>;
  original_CONTAINS?: InputMaybe<Scalars['String']>;
  original_ENDS_WITH?: InputMaybe<Scalars['String']>;
  original_IN?: InputMaybe<Array<Scalars['String']>>;
  original_STARTS_WITH?: InputMaybe<Scalars['String']>;
  tagged?: InputMaybe<Scalars['Boolean']>;
  thumbnail?: InputMaybe<Scalars['String']>;
  thumbnail_CONTAINS?: InputMaybe<Scalars['String']>;
  thumbnail_ENDS_WITH?: InputMaybe<Scalars['String']>;
  thumbnail_IN?: InputMaybe<Array<Scalars['String']>>;
  thumbnail_STARTS_WITH?: InputMaybe<Scalars['String']>;
}

export interface ImagesConnection {
  edges: Array<ImageEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface IntAggregateSelectionNullable {
  average?: Maybe<Scalars['Float']>;
  max?: Maybe<Scalars['Int']>;
  min?: Maybe<Scalars['Int']>;
  sum?: Maybe<Scalars['Int']>;
}

export enum LengthUnit {
  imperial = 'imperial',
  metric = 'metric',
}

export interface Mutation {
  createCustomers: CreateCustomersMutationResponse;
  createDescriptions: CreateDescriptionsMutationResponse;
  createHikes: CreateHikesMutationResponse;
  createImages: CreateImagesMutationResponse;
  createPois: CreatePoisMutationResponse;
  createProfiles: CreateProfilesMutationResponse;
  createRoutes: CreateRoutesMutationResponse;
  createSettings: CreateSettingsMutationResponse;
  createTypeWithPoints: CreateTypeWithPointsMutationResponse;
  createWaypoints: CreateWaypointsMutationResponse;
  deleteCustomers: DeleteInfo;
  deleteDescriptions: DeleteInfo;
  deleteHikes: DeleteInfo;
  deleteImages: DeleteInfo;
  deletePois: DeleteInfo;
  deleteProfiles: DeleteInfo;
  deleteRoutes: DeleteInfo;
  deleteSettings: DeleteInfo;
  deleteTypeWithPoints: DeleteInfo;
  deleteWaypoints: DeleteInfo;
  updateCustomers: UpdateCustomersMutationResponse;
  updateDescriptions: UpdateDescriptionsMutationResponse;
  updateHikes: UpdateHikesMutationResponse;
  updateImages: UpdateImagesMutationResponse;
  updatePois: UpdatePoisMutationResponse;
  updateProfiles: UpdateProfilesMutationResponse;
  updateRoutes: UpdateRoutesMutationResponse;
  updateSettings: UpdateSettingsMutationResponse;
  updateTypeWithPoints: UpdateTypeWithPointsMutationResponse;
  updateWaypoints: UpdateWaypointsMutationResponse;
}

export interface MutationCreateCustomersArgs {
  input: Array<CustomerCreateInput>;
}

export interface MutationCreateDescriptionsArgs {
  input: Array<DescriptionCreateInput>;
}

export interface MutationCreateHikesArgs {
  input: Array<HikeCreateInput>;
}

export interface MutationCreateImagesArgs {
  input: Array<ImageCreateInput>;
}

export interface MutationCreatePoisArgs {
  input: Array<PoiCreateInput>;
}

export interface MutationCreateProfilesArgs {
  input: Array<ProfileCreateInput>;
}

export interface MutationCreateRoutesArgs {
  input: Array<RouteCreateInput>;
}

export interface MutationCreateSettingsArgs {
  input: Array<SettingsCreateInput>;
}

export interface MutationCreateTypeWithPointsArgs {
  input: Array<TypeWithPointCreateInput>;
}

export interface MutationCreateWaypointsArgs {
  input: Array<WaypointCreateInput>;
}

export interface MutationDeleteCustomersArgs {
  where?: InputMaybe<CustomerWhere>;
}

export interface MutationDeleteDescriptionsArgs {
  where?: InputMaybe<DescriptionWhere>;
}

export interface MutationDeleteHikesArgs {
  delete?: InputMaybe<HikeDeleteInput>;
  where?: InputMaybe<HikeWhere>;
}

export interface MutationDeleteImagesArgs {
  where?: InputMaybe<ImageWhere>;
}

export interface MutationDeletePoisArgs {
  where?: InputMaybe<PoiWhere>;
}

export interface MutationDeleteProfilesArgs {
  where?: InputMaybe<ProfileWhere>;
}

export interface MutationDeleteRoutesArgs {
  where?: InputMaybe<RouteWhere>;
}

export interface MutationDeleteSettingsArgs {
  where?: InputMaybe<SettingsWhere>;
}

export interface MutationDeleteTypeWithPointsArgs {
  where?: InputMaybe<TypeWithPointWhere>;
}

export interface MutationDeleteWaypointsArgs {
  where?: InputMaybe<WaypointWhere>;
}

export interface MutationUpdateCustomersArgs {
  update?: InputMaybe<CustomerUpdateInput>;
  where?: InputMaybe<CustomerWhere>;
}

export interface MutationUpdateDescriptionsArgs {
  update?: InputMaybe<DescriptionUpdateInput>;
  where?: InputMaybe<DescriptionWhere>;
}

export interface MutationUpdateHikesArgs {
  connect?: InputMaybe<HikeConnectInput>;
  create?: InputMaybe<HikeRelationInput>;
  delete?: InputMaybe<HikeDeleteInput>;
  disconnect?: InputMaybe<HikeDisconnectInput>;
  update?: InputMaybe<HikeUpdateInput>;
  where?: InputMaybe<HikeWhere>;
}

export interface MutationUpdateImagesArgs {
  update?: InputMaybe<ImageUpdateInput>;
  where?: InputMaybe<ImageWhere>;
}

export interface MutationUpdatePoisArgs {
  update?: InputMaybe<PoiUpdateInput>;
  where?: InputMaybe<PoiWhere>;
}

export interface MutationUpdateProfilesArgs {
  update?: InputMaybe<ProfileUpdateInput>;
  where?: InputMaybe<ProfileWhere>;
}

export interface MutationUpdateRoutesArgs {
  update?: InputMaybe<RouteUpdateInput>;
  where?: InputMaybe<RouteWhere>;
}

export interface MutationUpdateSettingsArgs {
  update?: InputMaybe<SettingsUpdateInput>;
  where?: InputMaybe<SettingsWhere>;
}

export interface MutationUpdateTypeWithPointsArgs {
  update?: InputMaybe<TypeWithPointUpdateInput>;
  where?: InputMaybe<TypeWithPointWhere>;
}

export interface MutationUpdateWaypointsArgs {
  update?: InputMaybe<WaypointUpdateInput>;
  where?: InputMaybe<WaypointWhere>;
}

/** Pagination information (Relay) */
export interface PageInfo {
  endCursor?: Maybe<Scalars['String']>;
  hasNextPage: Scalars['Boolean'];
  hasPreviousPage: Scalars['Boolean'];
  startCursor?: Maybe<Scalars['String']>;
}

export interface Poi {
  address?: Maybe<Scalars['String']>;
  descriptions: Array<Maybe<Description>>;
  id?: Maybe<Scalars['String']>;
  images: Array<Maybe<Image>>;
  infoUrl?: Maybe<Scalars['String']>;
  location: Waypoint;
  openingHours?: Maybe<Scalars['String']>;
  phone?: Maybe<Scalars['String']>;
  tags?: Maybe<Array<Scalars['String']>>;
  type?: Maybe<Scalars['String']>;
}

export interface PoiAggregateSelection {
  address: StringAggregateSelectionNullable;
  count: Scalars['Int'];
  id: StringAggregateSelectionNullable;
  infoUrl: StringAggregateSelectionNullable;
  openingHours: StringAggregateSelectionNullable;
  phone: StringAggregateSelectionNullable;
  type: StringAggregateSelectionNullable;
}

export interface PoiCreateInput {
  address?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['String']>;
  infoUrl?: InputMaybe<Scalars['String']>;
  openingHours?: InputMaybe<Scalars['String']>;
  phone?: InputMaybe<Scalars['String']>;
  tags?: InputMaybe<Array<Scalars['String']>>;
  type?: InputMaybe<Scalars['String']>;
}

export interface PoiEdge {
  cursor: Scalars['String'];
  node: Poi;
}

export interface PoiOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more PoiSort objects to sort Pois by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<PoiSort>>;
}

/** Fields to sort Pois by. The order in which sorts are applied is not guaranteed when specifying many fields in one PoiSort object. */
export interface PoiSort {
  address?: InputMaybe<SortDirection>;
  id?: InputMaybe<SortDirection>;
  infoUrl?: InputMaybe<SortDirection>;
  openingHours?: InputMaybe<SortDirection>;
  phone?: InputMaybe<SortDirection>;
  type?: InputMaybe<SortDirection>;
}

export interface PoiUpdateInput {
  address?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['String']>;
  infoUrl?: InputMaybe<Scalars['String']>;
  openingHours?: InputMaybe<Scalars['String']>;
  phone?: InputMaybe<Scalars['String']>;
  tags?: InputMaybe<Array<Scalars['String']>>;
  tags_POP?: InputMaybe<Scalars['Int']>;
  tags_PUSH?: InputMaybe<Array<Scalars['String']>>;
  type?: InputMaybe<Scalars['String']>;
}

export interface PoiWhere {
  AND?: InputMaybe<Array<PoiWhere>>;
  NOT?: InputMaybe<PoiWhere>;
  OR?: InputMaybe<Array<PoiWhere>>;
  address?: InputMaybe<Scalars['String']>;
  address_CONTAINS?: InputMaybe<Scalars['String']>;
  address_ENDS_WITH?: InputMaybe<Scalars['String']>;
  address_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  address_STARTS_WITH?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['String']>;
  id_CONTAINS?: InputMaybe<Scalars['String']>;
  id_ENDS_WITH?: InputMaybe<Scalars['String']>;
  id_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  id_STARTS_WITH?: InputMaybe<Scalars['String']>;
  infoUrl?: InputMaybe<Scalars['String']>;
  infoUrl_CONTAINS?: InputMaybe<Scalars['String']>;
  infoUrl_ENDS_WITH?: InputMaybe<Scalars['String']>;
  infoUrl_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  infoUrl_STARTS_WITH?: InputMaybe<Scalars['String']>;
  openingHours?: InputMaybe<Scalars['String']>;
  openingHours_CONTAINS?: InputMaybe<Scalars['String']>;
  openingHours_ENDS_WITH?: InputMaybe<Scalars['String']>;
  openingHours_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  openingHours_STARTS_WITH?: InputMaybe<Scalars['String']>;
  phone?: InputMaybe<Scalars['String']>;
  phone_CONTAINS?: InputMaybe<Scalars['String']>;
  phone_ENDS_WITH?: InputMaybe<Scalars['String']>;
  phone_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  phone_STARTS_WITH?: InputMaybe<Scalars['String']>;
  tags?: InputMaybe<Array<Scalars['String']>>;
  tags_INCLUDES?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<Scalars['String']>;
  type_CONTAINS?: InputMaybe<Scalars['String']>;
  type_ENDS_WITH?: InputMaybe<Scalars['String']>;
  type_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  type_STARTS_WITH?: InputMaybe<Scalars['String']>;
}

export interface Point {
  crs: Scalars['String'];
  height?: Maybe<Scalars['Float']>;
  latitude: Scalars['Float'];
  longitude: Scalars['Float'];
  srid: Scalars['Int'];
}

export interface PointDistance {
  /** The distance in metres to be used when comparing two points */
  distance: Scalars['Float'];
  point: PointInput;
}

export interface PointInput {
  height?: InputMaybe<Scalars['Float']>;
  latitude: Scalars['Float'];
  longitude: Scalars['Float'];
}

export interface PoisConnection {
  edges: Array<PoiEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface Profile {
  birthDate?: Maybe<Scalars['String']>;
  firstName?: Maybe<Scalars['String']>;
  languages?: Maybe<Array<Scalars['String']>>;
  lastName?: Maybe<Scalars['String']>;
  phone?: Maybe<Scalars['String']>;
  picture?: Maybe<Scalars['String']>;
  username: Scalars['String'];
}

export interface ProfileAggregateSelection {
  birthDate: StringAggregateSelectionNullable;
  count: Scalars['Int'];
  firstName: StringAggregateSelectionNullable;
  lastName: StringAggregateSelectionNullable;
  phone: StringAggregateSelectionNullable;
  picture: StringAggregateSelectionNullable;
  username: StringAggregateSelectionNonNullable;
}

export interface ProfileCreateInput {
  birthDate?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  languages?: InputMaybe<Array<Scalars['String']>>;
  lastName?: InputMaybe<Scalars['String']>;
  phone?: InputMaybe<Scalars['String']>;
  picture?: InputMaybe<Scalars['String']>;
  username: Scalars['String'];
}

export interface ProfileEdge {
  cursor: Scalars['String'];
  node: Profile;
}

export interface ProfileOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more ProfileSort objects to sort Profiles by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<ProfileSort>>;
}

/** Fields to sort Profiles by. The order in which sorts are applied is not guaranteed when specifying many fields in one ProfileSort object. */
export interface ProfileSort {
  birthDate?: InputMaybe<SortDirection>;
  firstName?: InputMaybe<SortDirection>;
  lastName?: InputMaybe<SortDirection>;
  phone?: InputMaybe<SortDirection>;
  picture?: InputMaybe<SortDirection>;
  username?: InputMaybe<SortDirection>;
}

export interface ProfileUpdateInput {
  birthDate?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  languages?: InputMaybe<Array<Scalars['String']>>;
  languages_POP?: InputMaybe<Scalars['Int']>;
  languages_PUSH?: InputMaybe<Array<Scalars['String']>>;
  lastName?: InputMaybe<Scalars['String']>;
  phone?: InputMaybe<Scalars['String']>;
  picture?: InputMaybe<Scalars['String']>;
  username?: InputMaybe<Scalars['String']>;
}

export interface ProfileWhere {
  AND?: InputMaybe<Array<ProfileWhere>>;
  NOT?: InputMaybe<ProfileWhere>;
  OR?: InputMaybe<Array<ProfileWhere>>;
  birthDate?: InputMaybe<Scalars['String']>;
  birthDate_CONTAINS?: InputMaybe<Scalars['String']>;
  birthDate_ENDS_WITH?: InputMaybe<Scalars['String']>;
  birthDate_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  birthDate_STARTS_WITH?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  firstName_CONTAINS?: InputMaybe<Scalars['String']>;
  firstName_ENDS_WITH?: InputMaybe<Scalars['String']>;
  firstName_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  firstName_STARTS_WITH?: InputMaybe<Scalars['String']>;
  languages?: InputMaybe<Array<Scalars['String']>>;
  languages_INCLUDES?: InputMaybe<Scalars['String']>;
  lastName?: InputMaybe<Scalars['String']>;
  lastName_CONTAINS?: InputMaybe<Scalars['String']>;
  lastName_ENDS_WITH?: InputMaybe<Scalars['String']>;
  lastName_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  lastName_STARTS_WITH?: InputMaybe<Scalars['String']>;
  phone?: InputMaybe<Scalars['String']>;
  phone_CONTAINS?: InputMaybe<Scalars['String']>;
  phone_ENDS_WITH?: InputMaybe<Scalars['String']>;
  phone_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  phone_STARTS_WITH?: InputMaybe<Scalars['String']>;
  picture?: InputMaybe<Scalars['String']>;
  picture_CONTAINS?: InputMaybe<Scalars['String']>;
  picture_ENDS_WITH?: InputMaybe<Scalars['String']>;
  picture_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  picture_STARTS_WITH?: InputMaybe<Scalars['String']>;
  username?: InputMaybe<Scalars['String']>;
  username_CONTAINS?: InputMaybe<Scalars['String']>;
  username_ENDS_WITH?: InputMaybe<Scalars['String']>;
  username_IN?: InputMaybe<Array<Scalars['String']>>;
  username_STARTS_WITH?: InputMaybe<Scalars['String']>;
}

export interface ProfilesConnection {
  edges: Array<ProfileEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export enum PublicationState {
  archived = 'archived',
  draft = 'draft',
  published = 'published',
}

export interface Query {
  customers: Array<Customer>;
  customersAggregate: CustomerAggregateSelection;
  customersConnection: CustomersConnection;
  descriptions: Array<Description>;
  descriptionsAggregate: DescriptionAggregateSelection;
  descriptionsConnection: DescriptionsConnection;
  getRandomHikes: Array<Maybe<Scalars['String']>>;
  hikes: Array<Hike>;
  hikesAggregate: HikeAggregateSelection;
  hikesConnection: HikesConnection;
  images: Array<Image>;
  imagesAggregate: ImageAggregateSelection;
  imagesConnection: ImagesConnection;
  pois: Array<Poi>;
  poisAggregate: PoiAggregateSelection;
  poisConnection: PoisConnection;
  profiles: Array<Profile>;
  profilesAggregate: ProfileAggregateSelection;
  profilesConnection: ProfilesConnection;
  routes: Array<Route>;
  routesAggregate: RouteAggregateSelection;
  routesConnection: RoutesConnection;
  searchHikeByContent: Array<Maybe<Scalars['String']>>;
  searchHikeByRadius: Array<Maybe<Scalars['String']>>;
  settings: Array<Settings>;
  settingsAggregate: SettingsAggregateSelection;
  settingsConnection: SettingsConnection;
  typeWithPoints: Array<TypeWithPoint>;
  typeWithPointsAggregate: TypeWithPointAggregateSelection;
  typeWithPointsConnection: TypeWithPointsConnection;
  waypoints: Array<Waypoint>;
  waypointsAggregate: WaypointAggregateSelection;
  waypointsConnection: WaypointsConnection;
}

export interface QueryCustomersArgs {
  options?: InputMaybe<CustomerOptions>;
  where?: InputMaybe<CustomerWhere>;
}

export interface QueryCustomersAggregateArgs {
  where?: InputMaybe<CustomerWhere>;
}

export interface QueryCustomersConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  where?: InputMaybe<CustomerWhere>;
}

export interface QueryDescriptionsArgs {
  options?: InputMaybe<DescriptionOptions>;
  where?: InputMaybe<DescriptionWhere>;
}

export interface QueryDescriptionsAggregateArgs {
  where?: InputMaybe<DescriptionWhere>;
}

export interface QueryDescriptionsConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<DescriptionSort>>>;
  where?: InputMaybe<DescriptionWhere>;
}

export interface QueryGetRandomHikesArgs {
  limit: Scalars['Int'];
}

export interface QueryHikesArgs {
  options?: InputMaybe<HikeOptions>;
  where?: InputMaybe<HikeWhere>;
}

export interface QueryHikesAggregateArgs {
  where?: InputMaybe<HikeWhere>;
}

export interface QueryHikesConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<HikeSort>>>;
  where?: InputMaybe<HikeWhere>;
}

export interface QueryImagesArgs {
  options?: InputMaybe<ImageOptions>;
  where?: InputMaybe<ImageWhere>;
}

export interface QueryImagesAggregateArgs {
  where?: InputMaybe<ImageWhere>;
}

export interface QueryImagesConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<ImageSort>>>;
  where?: InputMaybe<ImageWhere>;
}

export interface QueryPoisArgs {
  options?: InputMaybe<PoiOptions>;
  where?: InputMaybe<PoiWhere>;
}

export interface QueryPoisAggregateArgs {
  where?: InputMaybe<PoiWhere>;
}

export interface QueryPoisConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<PoiSort>>>;
  where?: InputMaybe<PoiWhere>;
}

export interface QueryProfilesArgs {
  options?: InputMaybe<ProfileOptions>;
  where?: InputMaybe<ProfileWhere>;
}

export interface QueryProfilesAggregateArgs {
  where?: InputMaybe<ProfileWhere>;
}

export interface QueryProfilesConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<ProfileSort>>>;
  where?: InputMaybe<ProfileWhere>;
}

export interface QueryRoutesArgs {
  options?: InputMaybe<RouteOptions>;
  where?: InputMaybe<RouteWhere>;
}

export interface QueryRoutesAggregateArgs {
  where?: InputMaybe<RouteWhere>;
}

export interface QueryRoutesConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<RouteSort>>>;
  where?: InputMaybe<RouteWhere>;
}

export interface QuerySearchHikeByContentArgs {
  params: Scalars['String'];
}

export interface QuerySearchHikeByRadiusArgs {
  params: SearchByRadiusInput;
}

export interface QuerySettingsArgs {
  options?: InputMaybe<SettingsOptions>;
  where?: InputMaybe<SettingsWhere>;
}

export interface QuerySettingsAggregateArgs {
  where?: InputMaybe<SettingsWhere>;
}

export interface QuerySettingsConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<SettingsSort>>>;
  where?: InputMaybe<SettingsWhere>;
}

export interface QueryTypeWithPointsArgs {
  options?: InputMaybe<TypeWithPointOptions>;
  where?: InputMaybe<TypeWithPointWhere>;
}

export interface QueryTypeWithPointsAggregateArgs {
  where?: InputMaybe<TypeWithPointWhere>;
}

export interface QueryTypeWithPointsConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<TypeWithPointSort>>>;
  where?: InputMaybe<TypeWithPointWhere>;
}

export interface QueryWaypointsArgs {
  options?: InputMaybe<WaypointOptions>;
  where?: InputMaybe<WaypointWhere>;
}

export interface QueryWaypointsAggregateArgs {
  where?: InputMaybe<WaypointWhere>;
}

export interface QueryWaypointsConnectionArgs {
  after?: InputMaybe<Scalars['String']>;
  first?: InputMaybe<Scalars['Int']>;
  sort?: InputMaybe<Array<InputMaybe<WaypointSort>>>;
  where?: InputMaybe<WaypointWhere>;
}

export interface Route {
  coordinates: Array<Waypoint>;
  id?: Maybe<Scalars['String']>;
  images: Array<Maybe<Image>>;
  municipality?: Maybe<Scalars['String']>;
  offroutePois: Array<Maybe<Poi>>;
  onroutePois: Array<Maybe<Poi>>;
}

export interface RouteAggregateSelection {
  count: Scalars['Int'];
  id: StringAggregateSelectionNullable;
  municipality: StringAggregateSelectionNullable;
}

export interface RouteConnectWhere {
  node: RouteWhere;
}

export interface RouteCreateInput {
  id?: InputMaybe<Scalars['String']>;
  municipality?: InputMaybe<Scalars['String']>;
}

export interface RouteEdge {
  cursor: Scalars['String'];
  node: Route;
}

export interface RouteOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more RouteSort objects to sort Routes by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<RouteSort>>;
}

/** Fields to sort Routes by. The order in which sorts are applied is not guaranteed when specifying many fields in one RouteSort object. */
export interface RouteSort {
  id?: InputMaybe<SortDirection>;
  municipality?: InputMaybe<SortDirection>;
}

export interface RouteUpdateInput {
  id?: InputMaybe<Scalars['String']>;
  municipality?: InputMaybe<Scalars['String']>;
}

export interface RouteWhere {
  AND?: InputMaybe<Array<RouteWhere>>;
  NOT?: InputMaybe<RouteWhere>;
  OR?: InputMaybe<Array<RouteWhere>>;
  id?: InputMaybe<Scalars['String']>;
  id_CONTAINS?: InputMaybe<Scalars['String']>;
  id_ENDS_WITH?: InputMaybe<Scalars['String']>;
  id_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  id_STARTS_WITH?: InputMaybe<Scalars['String']>;
  municipality?: InputMaybe<Scalars['String']>;
  municipality_CONTAINS?: InputMaybe<Scalars['String']>;
  municipality_ENDS_WITH?: InputMaybe<Scalars['String']>;
  municipality_IN?: InputMaybe<Array<InputMaybe<Scalars['String']>>>;
  municipality_STARTS_WITH?: InputMaybe<Scalars['String']>;
}

export interface RoutesConnection {
  edges: Array<RouteEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface SearchByRadiusInput {
  origin: PointInput;
  radiusInMeters: Scalars['Int'];
}

export interface Settings {
  averageSpeed?: Maybe<Scalars['Int']>;
  lengthUnit?: Maybe<LengthUnit>;
}

export interface SettingsAggregateSelection {
  averageSpeed: IntAggregateSelectionNullable;
  count: Scalars['Int'];
}

export interface SettingsConnection {
  edges: Array<SettingsEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface SettingsCreateInput {
  averageSpeed?: InputMaybe<Scalars['Int']>;
  lengthUnit?: InputMaybe<LengthUnit>;
}

export interface SettingsEdge {
  cursor: Scalars['String'];
  node: Settings;
}

export interface SettingsOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more SettingsSort objects to sort Settings by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<SettingsSort>>;
}

/** Fields to sort Settings by. The order in which sorts are applied is not guaranteed when specifying many fields in one SettingsSort object. */
export interface SettingsSort {
  averageSpeed?: InputMaybe<SortDirection>;
  lengthUnit?: InputMaybe<SortDirection>;
}

export interface SettingsUpdateInput {
  averageSpeed?: InputMaybe<Scalars['Int']>;
  averageSpeed_DECREMENT?: InputMaybe<Scalars['Int']>;
  averageSpeed_INCREMENT?: InputMaybe<Scalars['Int']>;
  lengthUnit?: InputMaybe<LengthUnit>;
}

export interface SettingsWhere {
  AND?: InputMaybe<Array<SettingsWhere>>;
  NOT?: InputMaybe<SettingsWhere>;
  OR?: InputMaybe<Array<SettingsWhere>>;
  averageSpeed?: InputMaybe<Scalars['Int']>;
  averageSpeed_GT?: InputMaybe<Scalars['Int']>;
  averageSpeed_GTE?: InputMaybe<Scalars['Int']>;
  averageSpeed_IN?: InputMaybe<Array<InputMaybe<Scalars['Int']>>>;
  averageSpeed_LT?: InputMaybe<Scalars['Int']>;
  averageSpeed_LTE?: InputMaybe<Scalars['Int']>;
  lengthUnit?: InputMaybe<LengthUnit>;
  lengthUnit_IN?: InputMaybe<Array<InputMaybe<LengthUnit>>>;
}

export enum SortDirection {
  /** Sort by field values in ascending order. */
  asc = 'ASC',
  /** Sort by field values in descending order. */
  desc = 'DESC',
}

export interface StringAggregateSelectionNonNullable {
  longest: Scalars['String'];
  shortest: Scalars['String'];
}

export interface StringAggregateSelectionNullable {
  longest?: Maybe<Scalars['String']>;
  shortest?: Maybe<Scalars['String']>;
}

export interface TypeWithPoint {
  location: Point;
}

export interface TypeWithPointAggregateSelection {
  count: Scalars['Int'];
}

export interface TypeWithPointCreateInput {
  location: PointInput;
}

export interface TypeWithPointEdge {
  cursor: Scalars['String'];
  node: TypeWithPoint;
}

export interface TypeWithPointOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more TypeWithPointSort objects to sort TypeWithPoints by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<TypeWithPointSort>>;
}

/** Fields to sort TypeWithPoints by. The order in which sorts are applied is not guaranteed when specifying many fields in one TypeWithPointSort object. */
export interface TypeWithPointSort {
  location?: InputMaybe<SortDirection>;
}

export interface TypeWithPointUpdateInput {
  location?: InputMaybe<PointInput>;
}

export interface TypeWithPointWhere {
  AND?: InputMaybe<Array<TypeWithPointWhere>>;
  NOT?: InputMaybe<TypeWithPointWhere>;
  OR?: InputMaybe<Array<TypeWithPointWhere>>;
  location?: InputMaybe<PointInput>;
  location_DISTANCE?: InputMaybe<PointDistance>;
  location_GT?: InputMaybe<PointDistance>;
  location_GTE?: InputMaybe<PointDistance>;
  location_IN?: InputMaybe<Array<PointInput>>;
  location_LT?: InputMaybe<PointDistance>;
  location_LTE?: InputMaybe<PointDistance>;
}

export interface TypeWithPointsConnection {
  edges: Array<TypeWithPointEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export interface UpdateCustomersMutationResponse {
  customers: Array<Customer>;
  info: UpdateInfo;
}

export interface UpdateDescriptionsMutationResponse {
  descriptions: Array<Description>;
  info: UpdateInfo;
}

export interface UpdateHikesMutationResponse {
  hikes: Array<Hike>;
  info: UpdateInfo;
}

export interface UpdateImagesMutationResponse {
  images: Array<Image>;
  info: UpdateInfo;
}

export interface UpdateInfo {
  bookmark?: Maybe<Scalars['String']>;
  nodesCreated: Scalars['Int'];
  nodesDeleted: Scalars['Int'];
  relationshipsCreated: Scalars['Int'];
  relationshipsDeleted: Scalars['Int'];
}

export interface UpdatePoisMutationResponse {
  info: UpdateInfo;
  pois: Array<Poi>;
}

export interface UpdateProfilesMutationResponse {
  info: UpdateInfo;
  profiles: Array<Profile>;
}

export interface UpdateRoutesMutationResponse {
  info: UpdateInfo;
  routes: Array<Route>;
}

export interface UpdateSettingsMutationResponse {
  info: UpdateInfo;
  settings: Array<Settings>;
}

export interface UpdateTypeWithPointsMutationResponse {
  info: UpdateInfo;
  typeWithPoints: Array<TypeWithPoint>;
}

export interface UpdateWaypointsMutationResponse {
  info: UpdateInfo;
  waypoints: Array<Waypoint>;
}

export interface Waypoint {
  location: Point;
}

export interface WaypointAggregateSelection {
  count: Scalars['Int'];
}

export interface WaypointCreateInput {
  location: PointInput;
}

export interface WaypointEdge {
  cursor: Scalars['String'];
  node: Waypoint;
}

export interface WaypointOptions {
  limit?: InputMaybe<Scalars['Int']>;
  offset?: InputMaybe<Scalars['Int']>;
  /** Specify one or more WaypointSort objects to sort Waypoints by. The sorts will be applied in the order in which they are arranged in the array. */
  sort?: InputMaybe<Array<WaypointSort>>;
}

/** Fields to sort Waypoints by. The order in which sorts are applied is not guaranteed when specifying many fields in one WaypointSort object. */
export interface WaypointSort {
  location?: InputMaybe<SortDirection>;
}

export interface WaypointUpdateInput {
  location?: InputMaybe<PointInput>;
}

export interface WaypointWhere {
  AND?: InputMaybe<Array<WaypointWhere>>;
  NOT?: InputMaybe<WaypointWhere>;
  OR?: InputMaybe<Array<WaypointWhere>>;
  location?: InputMaybe<PointInput>;
  location_DISTANCE?: InputMaybe<PointDistance>;
  location_GT?: InputMaybe<PointDistance>;
  location_GTE?: InputMaybe<PointDistance>;
  location_IN?: InputMaybe<Array<PointInput>>;
  location_LT?: InputMaybe<PointDistance>;
  location_LTE?: InputMaybe<PointDistance>;
}

export interface WaypointsConnection {
  edges: Array<WaypointEdge>;
  pageInfo: PageInfo;
  totalCount: Scalars['Int'];
}

export type Requester<C = {}, E = unknown> = <R, V extends OperationVariables>(
  doc: DocumentNode,
  vars: V,
  options?: C,
) => Promise<R> | Observable<R>;
export function getSdk<C, E>(requester: Requester<C, E>) {
  return {};
}
export type Sdk = ReturnType<typeof getSdk>;
