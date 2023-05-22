/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const getImage = /* GraphQL */ `
  query GetImage($id: ID!) {
    getImage(id: $id) {
      id
      location {
        lat
        lon
      }
      original {
        url
        width
        height
      }
      card {
        url
        width
        height
      }
      thumbnail {
        url
        width
        height
      }
      sourceObject {
        objectType
        languageKey
        objectId
        url
      }
      attributions
      labels
      tagged
      banned
      createdAt
      updatedAt
    }
  }
`;
export const listImages = /* GraphQL */ `
  query ListImages(
    $filter: ModelImageFilterInput
    $limit: Int
    $nextToken: String
  ) {
    listImages(filter: $filter, limit: $limit, nextToken: $nextToken) {
      items {
        id
        location {
          lat
          lon
        }
        original {
          url
          width
          height
        }
        card {
          url
          width
          height
        }
        thumbnail {
          url
          width
          height
        }
        sourceObject {
          objectType
          languageKey
          objectId
          url
        }
        attributions
        labels
        tagged
        banned
        createdAt
        updatedAt
      }
      nextToken
    }
  }
`;
export const searchImages = /* GraphQL */ `
  query SearchImages(
    $filter: SearchableImageFilterInput
    $sort: [SearchableImageSortInput]
    $limit: Int
    $nextToken: String
    $from: Int
    $aggregates: [SearchableImageAggregationInput]
  ) {
    searchImages(
      filter: $filter
      sort: $sort
      limit: $limit
      nextToken: $nextToken
      from: $from
      aggregates: $aggregates
    ) {
      items {
        id
        location {
          lat
          lon
        }
        original {
          url
          width
          height
        }
        card {
          url
          width
          height
        }
        thumbnail {
          url
          width
          height
        }
        sourceObject {
          objectType
          languageKey
          objectId
          url
        }
        attributions
        labels
        tagged
        banned
        createdAt
        updatedAt
      }
      nextToken
      total
      aggregateItems {
        name
        result {
          ... on SearchableAggregateScalarResult {
            value
          }
          ... on SearchableAggregateBucketResult {
            buckets {
              key
              doc_count
            }
          }
        }
      }
    }
  }
`;
export const getPoi = /* GraphQL */ `
  query GetPoi($id: ID!) {
    getPoi(id: $id) {
      id
      elevation
      location {
        lat
        lon
      }
      type
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
      phoneNumber
      openingHours
      createdAt
      updatedAt
    }
  }
`;
export const listPois = /* GraphQL */ `
  query ListPois(
    $filter: ModelPoiFilterInput
    $limit: Int
    $nextToken: String
  ) {
    listPois(filter: $filter, limit: $limit, nextToken: $nextToken) {
      items {
        id
        elevation
        location {
          lat
          lon
        }
        type
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
        phoneNumber
        openingHours
        createdAt
        updatedAt
      }
      nextToken
    }
  }
`;
export const searchPois = /* GraphQL */ `
  query SearchPois(
    $filter: SearchablePoiFilterInput
    $sort: [SearchablePoiSortInput]
    $limit: Int
    $nextToken: String
    $from: Int
    $aggregates: [SearchablePoiAggregationInput]
  ) {
    searchPois(
      filter: $filter
      sort: $sort
      limit: $limit
      nextToken: $nextToken
      from: $from
      aggregates: $aggregates
    ) {
      items {
        id
        elevation
        location {
          lat
          lon
        }
        type
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
        phoneNumber
        openingHours
        createdAt
        updatedAt
      }
      nextToken
      total
      aggregateItems {
        name
        result {
          ... on SearchableAggregateScalarResult {
            value
          }
          ... on SearchableAggregateBucketResult {
            buckets {
              key
              doc_count
            }
          }
        }
      }
    }
  }
`;
export const getHike = /* GraphQL */ `
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
      route {
        type
        coordinates
      }
      publicationState
      featured
      rate
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
        poiId
        point {
          lat
          lon
          elevation
        }
      }
      tags
      closestPlace
      location {
        lat
        lon
      }
      createdAt
      updatedAt
    }
  }
`;
export const listHikes = /* GraphQL */ `
  query ListHikes(
    $filter: ModelHikeFilterInput
    $limit: Int
    $nextToken: String
  ) {
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
        route {
          type
          coordinates
        }
        publicationState
        featured
        rate
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
          poiId
          point {
            lat
            lon
            elevation
          }
        }
        tags
        closestPlace
        location {
          lat
          lon
        }
        createdAt
        updatedAt
      }
      nextToken
    }
  }
`;
export const searchHikes = /* GraphQL */ `
  query SearchHikes(
    $filter: SearchableHikeFilterInput
    $sort: [SearchableHikeSortInput]
    $limit: Int
    $nextToken: String
    $from: Int
    $aggregates: [SearchableHikeAggregationInput]
  ) {
    searchHikes(
      filter: $filter
      sort: $sort
      limit: $limit
      nextToken: $nextToken
      from: $from
      aggregates: $aggregates
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
        route {
          type
          coordinates
        }
        publicationState
        featured
        rate
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
          poiId
          point {
            lat
            lon
            elevation
          }
        }
        tags
        closestPlace
        location {
          lat
          lon
        }
        createdAt
        updatedAt
      }
      nextToken
      total
      aggregateItems {
        name
        result {
          ... on SearchableAggregateScalarResult {
            value
          }
          ... on SearchableAggregateBucketResult {
            buckets {
              key
              doc_count
            }
          }
        }
      }
    }
  }
`;
export const searchByContent = /* GraphQL */ `
  query SearchByContent($query: SearchByContentInput!) {
    searchByContent(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchByRadius = /* GraphQL */ `
  query SearchByRadius($query: SearchByRadiusInput!) {
    searchByRadius(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchHikeByRadius = /* GraphQL */ `
  query SearchHikeByRadius($query: SearchHikeByRadiusInput!) {
    searchHikeByRadius(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchInEnvelope = /* GraphQL */ `
  query SearchInEnvelope($query: SearchInEnvelopeInput!) {
    searchInEnvelope(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchInShape = /* GraphQL */ `
  query SearchInShape($query: SearchInShapeInput!) {
    searchInShape(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchInMultipolygon = /* GraphQL */ `
  query SearchInMultipolygon($query: SearchInMultipolygonInput!) {
    searchInMultipolygon(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchAroundHike = /* GraphQL */ `
  query SearchAroundHike($query: SearchAroundHikeInput!) {
    searchAroundHike(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchSafeImagesAroundHike = /* GraphQL */ `
  query SearchSafeImagesAroundHike($query: SearchSafeImagesAroundHikeInput!) {
    searchSafeImagesAroundHike(query: $query) {
      items
      nextToken
      total
    }
  }
`;
export const searchSafeImagesAroundLocation = /* GraphQL */ `
  query SearchSafeImagesAroundLocation($query: SearchByRadiusInput!) {
    searchSafeImagesAroundLocation(query: $query) {
      items
      nextToken
      total
    }
  }
`;
