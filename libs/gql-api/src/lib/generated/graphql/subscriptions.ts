/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const onCreateHike = /* GraphQL */ `
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
export const onUpdateHike = /* GraphQL */ `
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
export const onDeleteHike = /* GraphQL */ `
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
