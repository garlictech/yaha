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

export interface GetNodeInput {
  id: Scalars['ID'];
  label: ValidDataLabels;
}

export interface Node {
  id: Scalars['ID'];
  label?: Maybe<ValidDataLabels>;
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

export interface Query {
  getNode?: Maybe<Node>;
}


export interface QueryGetNodeArgs {
  input: GetNodeInput;
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

export enum ValidDataLabels {
  hike = 'Hike'
}


export type Requester<C= {}> = <R, V>(doc: DocumentNode, vars?: V, options?: C) => Promise<R> & Observable<R>
export function getSdk<C>(requester: Requester<C>) {
  return {

  };
}
export type Sdk = ReturnType<typeof getSdk>;