import { ModelInit, MutableModel, PersistentModelConstructor } from "@aws-amplify/datastore";

export enum PublicationState {
  DRAFT = "draft",
  PUBLISHED = "published",
  ARCHIVED = "archived"
}

export enum TextualDescriptionType {
  MARKDOWN = "markdown",
  HTML = "html"
}

export enum PoiSource {
  GOOGLE = "google",
  WIKIPEDIA = "wikipedia",
  OSM_AMENITY = "osmAmenity",
  OSM_NATURAL = "osmNatural",
  OSM_ROUTE = "osmRoute",
  OSM_PUBLIC_TRANSPORT = "osmPublicTransport",
  OSM_EMERGENCY = "osmEmergency",
  OSM_HISTORIC = "osmHistoric",
  OSM_LEISURE = "osmLeisure",
  OSM_MAN_MADE = "osmManMade",
  OSM_MILITARY = "osmMilitary",
  OSM_SHOP = "osmShop",
  OSM_TOURISM = "osmTourism",
  MAPILLARY = "mapillary",
  FLICKR = "flickr"
}

export enum ValidDataLabels {
  HIKE = "Hike"
}

export declare class Point {
  readonly lat: number;
  readonly lon: number;
  readonly ele?: number;
  constructor(init: ModelInit<Point>);
}

export declare class TextualDescription {
  readonly languageKey: string;
  readonly title?: string;
  readonly summary?: string;
  readonly fullDescription?: string;
  readonly type: TextualDescriptionType | keyof typeof TextualDescriptionType;
  constructor(init: ModelInit<TextualDescription>);
}

export declare class BoundingBox {
  readonly NorthEast: Point;
  readonly SouthWest: Point;
  constructor(init: ModelInit<BoundingBox>);
}

export declare class RouteData {
  readonly distance: number;
  readonly uphill: number;
  readonly downhill: number;
  readonly track: number[];
  readonly bigBuffer: number[];
  readonly smallBuffer: number[];
  readonly averageTime: number;
  readonly score: number;
  readonly difficulty: number;
  readonly bounds: BoundingBox;
  readonly isRoundTrip: boolean;
  readonly poiSearchBox: BoundingBox;
  constructor(init: ModelInit<RouteData>);
}

export declare class HikeStop {
  readonly poiId: string;
  readonly description?: TextualDescription[];
  constructor(init: ModelInit<HikeStop>);
}

export declare class PoiSourceObject {
  readonly objectType: PoiSource | keyof typeof PoiSource;
  readonly languageKey?: string;
  readonly objectId: string;
  readonly url?: string;
  constructor(init: ModelInit<PoiSourceObject>);
}

export declare class Poi {
  readonly id: string;
  readonly location: Point;
  readonly types?: string[];
  readonly description: TextualDescription[];
  readonly tags?: string[];
  readonly sourceObject: PoiSourceObject[];
  readonly address?: string;
  readonly phoneFloat?: string;
  readonly openingHours?: string;
  constructor(init: ModelInit<Poi>);
}

type HikeMetaData = {
  readOnlyFields: 'createdAt' | 'updatedAt';
}

export declare class Hike {
  readonly id: string;
  readonly description: TextualDescription[];
  readonly location: string;
  readonly publicationState: PublicationState | keyof typeof PublicationState;
  readonly featured?: boolean;
  readonly rate?: string;
  readonly offlineMap?: string;
  readonly featuredStops?: (HikeStop | null)[];
  readonly checkpoints?: (Poi | null)[];
  readonly tags?: string[];
  readonly route: RouteData;
  readonly startPoint: Point;
  readonly endPoint: Point;
  readonly createdAt?: string;
  readonly updatedAt?: string;
  constructor(init: ModelInit<Hike, HikeMetaData>);
  static copyOf(source: Hike, mutator: (draft: MutableModel<Hike, HikeMetaData>) => MutableModel<Hike, HikeMetaData> | void): Hike;
}