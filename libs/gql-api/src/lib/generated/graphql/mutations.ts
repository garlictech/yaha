/* tslint:disable */
/* eslint-disable */
// this is an auto generated file. This will be overwritten

export const createImage = /* GraphQL */ `
  mutation CreateImage(
    $input: CreateImageInput!
    $condition: ModelImageConditionInput
  ) {
    createImage(input: $input, condition: $condition) {
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
export const updateImage = /* GraphQL */ `
  mutation UpdateImage(
    $input: UpdateImageInput!
    $condition: ModelImageConditionInput
  ) {
    updateImage(input: $input, condition: $condition) {
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
export const deleteImage = /* GraphQL */ `
  mutation DeleteImage(
    $input: DeleteImageInput!
    $condition: ModelImageConditionInput
  ) {
    deleteImage(input: $input, condition: $condition) {
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
export const createPoi = /* GraphQL */ `
  mutation CreatePoi(
    $input: CreatePoiInput!
    $condition: ModelPoiConditionInput
  ) {
    createPoi(input: $input, condition: $condition) {
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
export const updatePoi = /* GraphQL */ `
  mutation UpdatePoi(
    $input: UpdatePoiInput!
    $condition: ModelPoiConditionInput
  ) {
    updatePoi(input: $input, condition: $condition) {
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
export const deletePoi = /* GraphQL */ `
  mutation DeletePoi(
    $input: DeletePoiInput!
    $condition: ModelPoiConditionInput
  ) {
    deletePoi(input: $input, condition: $condition) {
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
