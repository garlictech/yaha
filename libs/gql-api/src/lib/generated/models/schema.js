export const schema = {
    "models": {
        "Hike": {
            "name": "Hike",
            "fields": {
                "id": {
                    "name": "id",
                    "isArray": false,
                    "type": "ID",
                    "isRequired": true,
                    "attributes": []
                },
                "description": {
                    "name": "description",
                    "isArray": true,
                    "type": {
                        "nonModel": "TextualDescription"
                    },
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": false
                },
                "location": {
                    "name": "location",
                    "isArray": false,
                    "type": "String",
                    "isRequired": true,
                    "attributes": []
                },
                "publicationState": {
                    "name": "publicationState",
                    "isArray": false,
                    "type": {
                        "enum": "PublicationState"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "featured": {
                    "name": "featured",
                    "isArray": false,
                    "type": "Boolean",
                    "isRequired": false,
                    "attributes": []
                },
                "rate": {
                    "name": "rate",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "offlineMap": {
                    "name": "offlineMap",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "featuredStops": {
                    "name": "featuredStops",
                    "isArray": true,
                    "type": {
                        "nonModel": "HikeStop"
                    },
                    "isRequired": false,
                    "attributes": [],
                    "isArrayNullable": true
                },
                "checkpoints": {
                    "name": "checkpoints",
                    "isArray": true,
                    "type": {
                        "nonModel": "Poi"
                    },
                    "isRequired": false,
                    "attributes": [],
                    "isArrayNullable": true
                },
                "tags": {
                    "name": "tags",
                    "isArray": true,
                    "type": "String",
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": true
                },
                "route": {
                    "name": "route",
                    "isArray": false,
                    "type": {
                        "nonModel": "RouteData"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "startPoint": {
                    "name": "startPoint",
                    "isArray": false,
                    "type": {
                        "nonModel": "Point"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "endPoint": {
                    "name": "endPoint",
                    "isArray": false,
                    "type": {
                        "nonModel": "Point"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "createdAt": {
                    "name": "createdAt",
                    "isArray": false,
                    "type": "AWSDateTime",
                    "isRequired": false,
                    "attributes": [],
                    "isReadOnly": true
                },
                "updatedAt": {
                    "name": "updatedAt",
                    "isArray": false,
                    "type": "AWSDateTime",
                    "isRequired": false,
                    "attributes": [],
                    "isReadOnly": true
                }
            },
            "syncable": true,
            "pluralName": "Hikes",
            "attributes": [
                {
                    "type": "model",
                    "properties": {}
                }
            ]
        }
    },
    "enums": {
        "PublicationState": {
            "name": "PublicationState",
            "values": [
                "draft",
                "published",
                "archived"
            ]
        },
        "TextualDescriptionType": {
            "name": "TextualDescriptionType",
            "values": [
                "markdown",
                "html"
            ]
        },
        "PoiSource": {
            "name": "PoiSource",
            "values": [
                "google",
                "wikipedia",
                "osmAmenity",
                "osmNatural",
                "osmRoute",
                "osmPublicTransport",
                "osmEmergency",
                "osmHistoric",
                "osmLeisure",
                "osmManMade",
                "osmMilitary",
                "osmShop",
                "osmTourism",
                "mapillary",
                "flickr"
            ]
        },
        "ValidDataLabels": {
            "name": "ValidDataLabels",
            "values": [
                "Hike"
            ]
        }
    },
    "nonModels": {
        "Point": {
            "name": "Point",
            "fields": {
                "lat": {
                    "name": "lat",
                    "isArray": false,
                    "type": "Float",
                    "isRequired": true,
                    "attributes": []
                },
                "lon": {
                    "name": "lon",
                    "isArray": false,
                    "type": "Float",
                    "isRequired": true,
                    "attributes": []
                },
                "ele": {
                    "name": "ele",
                    "isArray": false,
                    "type": "Float",
                    "isRequired": false,
                    "attributes": []
                }
            }
        },
        "TextualDescription": {
            "name": "TextualDescription",
            "fields": {
                "languageKey": {
                    "name": "languageKey",
                    "isArray": false,
                    "type": "String",
                    "isRequired": true,
                    "attributes": []
                },
                "title": {
                    "name": "title",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "summary": {
                    "name": "summary",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "fullDescription": {
                    "name": "fullDescription",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "type": {
                    "name": "type",
                    "isArray": false,
                    "type": {
                        "enum": "TextualDescriptionType"
                    },
                    "isRequired": true,
                    "attributes": []
                }
            }
        },
        "BoundingBox": {
            "name": "BoundingBox",
            "fields": {
                "NorthEast": {
                    "name": "NorthEast",
                    "isArray": false,
                    "type": {
                        "nonModel": "Point"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "SouthWest": {
                    "name": "SouthWest",
                    "isArray": false,
                    "type": {
                        "nonModel": "Point"
                    },
                    "isRequired": true,
                    "attributes": []
                }
            }
        },
        "RouteData": {
            "name": "RouteData",
            "fields": {
                "distance": {
                    "name": "distance",
                    "isArray": false,
                    "type": "Int",
                    "isRequired": true,
                    "attributes": []
                },
                "uphill": {
                    "name": "uphill",
                    "isArray": false,
                    "type": "Int",
                    "isRequired": true,
                    "attributes": []
                },
                "downhill": {
                    "name": "downhill",
                    "isArray": false,
                    "type": "Int",
                    "isRequired": true,
                    "attributes": []
                },
                "track": {
                    "name": "track",
                    "isArray": true,
                    "type": "Float",
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": false
                },
                "bigBuffer": {
                    "name": "bigBuffer",
                    "isArray": true,
                    "type": "Float",
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": false
                },
                "smallBuffer": {
                    "name": "smallBuffer",
                    "isArray": true,
                    "type": "Float",
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": false
                },
                "averageTime": {
                    "name": "averageTime",
                    "isArray": false,
                    "type": "Int",
                    "isRequired": true,
                    "attributes": []
                },
                "score": {
                    "name": "score",
                    "isArray": false,
                    "type": "Int",
                    "isRequired": true,
                    "attributes": []
                },
                "difficulty": {
                    "name": "difficulty",
                    "isArray": false,
                    "type": "Int",
                    "isRequired": true,
                    "attributes": []
                },
                "bounds": {
                    "name": "bounds",
                    "isArray": false,
                    "type": {
                        "nonModel": "BoundingBox"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "isRoundTrip": {
                    "name": "isRoundTrip",
                    "isArray": false,
                    "type": "Boolean",
                    "isRequired": true,
                    "attributes": []
                },
                "poiSearchBox": {
                    "name": "poiSearchBox",
                    "isArray": false,
                    "type": {
                        "nonModel": "BoundingBox"
                    },
                    "isRequired": true,
                    "attributes": []
                }
            }
        },
        "HikeStop": {
            "name": "HikeStop",
            "fields": {
                "poiId": {
                    "name": "poiId",
                    "isArray": false,
                    "type": "ID",
                    "isRequired": true,
                    "attributes": []
                },
                "description": {
                    "name": "description",
                    "isArray": true,
                    "type": {
                        "nonModel": "TextualDescription"
                    },
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": true
                }
            }
        },
        "PoiSourceObject": {
            "name": "PoiSourceObject",
            "fields": {
                "objectType": {
                    "name": "objectType",
                    "isArray": false,
                    "type": {
                        "enum": "PoiSource"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "languageKey": {
                    "name": "languageKey",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "objectId": {
                    "name": "objectId",
                    "isArray": false,
                    "type": "String",
                    "isRequired": true,
                    "attributes": []
                },
                "url": {
                    "name": "url",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                }
            }
        },
        "Poi": {
            "name": "Poi",
            "fields": {
                "id": {
                    "name": "id",
                    "isArray": false,
                    "type": "ID",
                    "isRequired": true,
                    "attributes": []
                },
                "location": {
                    "name": "location",
                    "isArray": false,
                    "type": {
                        "nonModel": "Point"
                    },
                    "isRequired": true,
                    "attributes": []
                },
                "types": {
                    "name": "types",
                    "isArray": true,
                    "type": "String",
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": true
                },
                "description": {
                    "name": "description",
                    "isArray": true,
                    "type": {
                        "nonModel": "TextualDescription"
                    },
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": false
                },
                "tags": {
                    "name": "tags",
                    "isArray": true,
                    "type": "String",
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": true
                },
                "sourceObject": {
                    "name": "sourceObject",
                    "isArray": true,
                    "type": {
                        "nonModel": "PoiSourceObject"
                    },
                    "isRequired": true,
                    "attributes": [],
                    "isArrayNullable": false
                },
                "address": {
                    "name": "address",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "phoneFloat": {
                    "name": "phoneFloat",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                },
                "openingHours": {
                    "name": "openingHours",
                    "isArray": false,
                    "type": "String",
                    "isRequired": false,
                    "attributes": []
                }
            }
        }
    },
    "version": "1f55206fa71ad603c2a198c79dcdcfc0"
};