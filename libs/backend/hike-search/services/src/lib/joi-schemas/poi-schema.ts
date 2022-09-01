import { validateSchema } from '../joi-validator';
import * as Joi from 'joi';
import {
  coordinatesSchemaFragment,
  textualDescriptionSchema,
} from './schema-utils';
import { ExternalPoi } from '../external-poi';

// CreatePoiInput
export const createPoiInputSchema = {
  externalId: Joi.string(),
  location: Joi.object(coordinatesSchemaFragment).required(),
  description: Joi.object(textualDescriptionSchema).required(),
  type: Joi.string(),
  infoUrl: Joi.string(),
  address: Joi.string(),
  phoneNumber: Joi.string(),
  openingHours: Joi.string(),
};

export const { validate: validateCreatePoiInput, isType: isCreatePoiInput } =
  validateSchema<ExternalPoi>(createPoiInputSchema);
