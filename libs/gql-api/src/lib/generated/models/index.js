// @ts-check
import { initSchema } from '@aws-amplify/datastore';
import { schema } from './schema';

const PublicationState = {
  "DRAFT": "draft",
  "PUBLISHED": "published",
  "ARCHIVED": "archived"
};

const TextualDescriptionType = {
  "MARKDOWN": "markdown",
  "HTML": "html"
};

const PoiSource = {
  "GOOGLE": "google",
  "WIKIPEDIA": "wikipedia",
  "OSM_AMENITY": "osmAmenity",
  "OSM_NATURAL": "osmNatural",
  "OSM_ROUTE": "osmRoute",
  "OSM_PUBLIC_TRANSPORT": "osmPublicTransport",
  "OSM_EMERGENCY": "osmEmergency",
  "OSM_HISTORIC": "osmHistoric",
  "OSM_LEISURE": "osmLeisure",
  "OSM_MAN_MADE": "osmManMade",
  "OSM_MILITARY": "osmMilitary",
  "OSM_SHOP": "osmShop",
  "OSM_TOURISM": "osmTourism",
  "MAPILLARY": "mapillary",
  "FLICKR": "flickr"
};

const ValidDataLabels = {
  "HIKE": "Hike"
};

const { Hike, Point, TextualDescription, BoundingBox, RouteData, HikeStop, PoiSourceObject, Poi } = initSchema(schema);

export {
  Hike,
  PublicationState,
  TextualDescriptionType,
  PoiSource,
  ValidDataLabels,
  Point,
  TextualDescription,
  BoundingBox,
  RouteData,
  HikeStop,
  PoiSourceObject,
  Poi
};