/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const getNode = /* GraphQL */ `
  query GetNode($input: GetNodeInput!) {
    getNode(input: $input) {
      id
      label
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
export const syncHikes = /* GraphQL */ `
  query SyncHikes(
    $filter: ModelHikeFilterInput
    $limit: Int
    $nextToken: String
    $lastSync: AWSTimestamp
  ) {
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
