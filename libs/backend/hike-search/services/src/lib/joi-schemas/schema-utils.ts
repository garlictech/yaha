import * as Joi from 'joi';
import { Observable } from 'rxjs';
import { validateSchema } from '../joi-validator';

export const textualDescriptionSchema = Joi.array().items(
  Joi.object()
    .keys({
      languageKey: Joi.string().required(),
      title: Joi.string().allow(null),
      summary: Joi.string().allow(null),
      fullDescription: Joi.string().allow(null),
      type: Joi.string().required(),
    })
    .required(),
);

export const latitudeSchema = Joi.number().min(-90).max(90).precision(8);

export const longitudeSchema = Joi.number().min(-180).max(180).precision(8);

export const coordinatesSchemaFragment = {
  lon: longitudeSchema.required(),
  lat: latitudeSchema.required(),
};

export const pointSchema = Joi.object().keys({
  ...coordinatesSchemaFragment,
  elevation: Joi.number(),
});

export const checkpointSchema = Joi.alternatives().try(
  Joi.object().keys({ poiId: Joi.string().required() }),
  Joi.object().keys({ point: pointSchema.required() }),
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

export function multipleObjectValidator<TYPE>(
  itemSchema: Joi.SchemaLike,
): (arg: unknown) => Observable<TYPE> {
  const arrayschema = Joi.array().items(itemSchema).required();

  const { validate } = validateSchema<TYPE>(arrayschema);
  return validate;
}

// BoundingBox
export const boundingBoxSchema = {
  NorthEast: pointSchema,
  SouthWest: pointSchema,
};
