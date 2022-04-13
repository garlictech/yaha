import { validateSchema } from '../joi-validator';
import { YahaApi } from '@yaha/gql-api';
import * as Joi from 'joi';
import {
  coordinatesSchemaFragment,
  poiSourceObjectSchema,
  textualDescriptionSchema,
} from './schema-utils';

// CreatePoiInput
export const createPoiInputSchema = {
  elevation: Joi.number(),
  types: Joi.array().items(Joi.string()),
  sourceObject: Joi.object(poiSourceObjectSchema),
  location: Joi.object(coordinatesSchemaFragment).required(),
  address: Joi.string(),
  phoneNumber: Joi.string(),
  openingHours: Joi.string(),
  description: textualDescriptionSchema,
};

export const { validate: validateCreatePoiInput, isType: isCreatePoiInput } =
  validateSchema<YahaApi.CreatePoiInput>(createPoiInputSchema);
