/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const onCreateImage = /* GraphQL */ `
  subscription OnCreateImage {
    onCreateImage {
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
export const onUpdateImage = /* GraphQL */ `
  subscription OnUpdateImage {
    onUpdateImage {
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
export const onDeleteImage = /* GraphQL */ `
  subscription OnDeleteImage {
    onDeleteImage {
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
export const onCreatePoi = /* GraphQL */ `
  subscription OnCreatePoi {
    onCreatePoi {
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
export const onUpdatePoi = /* GraphQL */ `
  subscription OnUpdatePoi {
    onUpdatePoi {
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
export const onDeletePoi = /* GraphQL */ `
  subscription OnDeletePoi {
    onDeletePoi {
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
