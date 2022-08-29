import { YahaApi } from '@yaha/gql-api';
import * as Joi from 'joi';

import { validateSchema } from '../joi-validator';
import { coordinatesSchemaFragment } from './schema-utils';

const imageInfoSchema = {
  url: Joi.string().uri().required(),
  width: Joi.number().integer().positive(),
  height: Joi.number().integer().positive(),
};

const imageLabelSchema = {
  label: Joi.string().required(),
  confidence: Joi.number().positive(),
};

export const createImageInputSchema = {
  location: Joi.object().keys(coordinatesSchemaFragment),
  original: Joi.object().keys(imageInfoSchema).required(),
  card: Joi.object().keys(imageInfoSchema).required(),
  thumbnail: Joi.object().keys(imageInfoSchema).required(),
  id: Joi.string(),
  attributions: Joi.string(),
  banned: Joi.boolean(),
  labels: Joi.array().items(Joi.object(imageLabelSchema)),
};

export const {
  validate: validateCreateImageInput,
  isType: isCreateImageInput,
} = validateSchema<YahaApi.Image>(createImageInputSchema);
