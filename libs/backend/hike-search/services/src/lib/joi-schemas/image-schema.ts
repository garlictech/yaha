import * as Joi from 'joi';
import { ExternalImage } from '../external-poi';

import { validateSchema } from '../joi-validator';
import { coordinatesSchemaFragment } from './schema-utils';

export const createImageInputSchema = {
  location: Joi.object().keys(coordinatesSchemaFragment).required(),
  original: Joi.string().required(),
  card: Joi.string().required(),
  thumbnail: Joi.string().required(),
  externalId: Joi.string().required(),
};

export const {
  validate: validateCreateImageInput,
  isType: isCreateImageInput,
} = validateSchema<ExternalImage>(createImageInputSchema);
