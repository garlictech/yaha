import { Observable } from 'rxjs';
import { DocumentNode } from 'graphql';
import gql from 'graphql-tag';
export type Maybe<T> = T | null;
export type Exact<T extends { [key: string]: unknown }> = {
  [K in keyof T]: T[K];
};
export type MakeOptional<T, K extends keyof T> = Omit<T, K> &
  { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> &
  { [SubKey in K]: Maybe<T[SubKey]> };
/** All built-in and custom scalars, mapped to their actual values */
export interface Scalars {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
}

export enum PublicationState {
  draft = 'draft',
  published = 'published',
  archived = 'archived',
}

export interface TextualDescription {
  languageKey: Scalars['String'];
  title?: Maybe<Scalars['String']>;
  summary?: Maybe<Scalars['String']>;
  fullDescription?: Maybe<Scalars['String']>;
  type: TextualDescriptionType;
}

export enum TextualDescriptionType {
  markdown = 'markdown',
  html = 'html',
}

export type Requester<C = {}> = <R, V>(
  doc: DocumentNode,
  vars?: V,
  options?: C,
) => Promise<R> & Observable<R>;
export function getSdk<C>(requester: Requester<C>) {
  return {};
}
export type Sdk = ReturnType<typeof getSdk>;
