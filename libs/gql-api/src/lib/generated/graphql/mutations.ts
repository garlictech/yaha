/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const createHike = /* GraphQL */ `
  mutation CreateHike(
    $input: CreateHikeInput!
    $condition: ModelHikeConditionInput
  ) {
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
export const updateHike = /* GraphQL */ `
  mutation UpdateHike(
    $input: UpdateHikeInput!
    $condition: ModelHikeConditionInput
  ) {
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
export const deleteHike = /* GraphQL */ `
  mutation DeleteHike(
    $input: DeleteHikeInput!
    $condition: ModelHikeConditionInput
  ) {
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
