import * as Joi from 'joi';

export const textualDescriptionSchema = Joi.array().items(
  Joi.object({
    languageKey: Joi.string().required(),
    title: Joi.string(),
    summary: Joi.string(),
    fullDescription: Joi.string(),
    type: Joi.string().required(),
  }),
);

export const latitudeSchema = Joi.number().min(-90).max(90).precision(8);

export const longitudeSchema = Joi.number().min(-180).max(180).precision(8);

export const coordinatesSchemaFragment = {
  lon: longitudeSchema.required(),
  lat: latitudeSchema.required(),
};

export const pointSchema = Joi.object({
  ...coordinatesSchemaFragment,
  elevation: Joi.number(),
});

export const checkpointSchema = Joi.alternatives().try(
  Joi.object({ poiId: Joi.string().required() }),
  Joi.object({ point: pointSchema.required() }),
);

export const poiSourceObjectSchema = {
  languageKey: Joi.string(),
  objectType: Joi.string().required(),
  objectId: Joi.string().required(),
  url: Joi.string().uri(),
};

export const descriptionSchemaFragment = {
  description: textualDescriptionSchema.required(),
};

// BoundingBox
export const boundingBoxSchema = {
  NorthEast: pointSchema,
  SouthWest: pointSchema,
};
