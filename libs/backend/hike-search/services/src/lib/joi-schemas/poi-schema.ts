import { validateSchema } from '../joi-validator';
import { YahaApi } from '@yaha/gql-api';
import * as Joi from 'joi';
import {
  coordinatesSchemaFragment,
  textualDescriptionSchema,
} from './schema-utils';

// CreatePoiInput
export const createPoiInputSchema = {
  elevation: Joi.number(),
  type: Joi.string(),
  id: Joi.string(),
  location: Joi.object(coordinatesSchemaFragment).required(),
  address: Joi.string(),
  phoneNumber: Joi.string(),
  openingHours: Joi.string(),
  description: textualDescriptionSchema,
};

export const { validate: validateCreatePoiInput, isType: isCreatePoiInput } =
  validateSchema<YahaApi.Poi>(createPoiInputSchema);
