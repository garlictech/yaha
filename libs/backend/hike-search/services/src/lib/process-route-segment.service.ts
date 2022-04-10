import * as R from 'ramda';
import { Position } from '@turf/helpers';
import * as E from 'fp-ts/lib/Either';
import * as O from 'fp-ts/lib/Option';
import * as fp from 'lodash/fp';
import { forkJoin, Observable, of, throwError } from 'rxjs';
import { switchMap, map } from 'rxjs/operators';
import { pipe } from 'fp-ts/lib/function';
import { Feature, Polygon } from '@turf/helpers';
import { GtrackDefaults } from './defaults/defaults';
import { PoiFp } from './poi';
import { getElevationOfPointsFromGoogle } from './elevation';
import { ImageFp } from './image.fp';
import { RouteSegmentFp, RouteSegment, EBuffer } from './route-segment';
import { DESCRIPTION_LANGUAGES_SHORT } from './language/language.fp';
import { YahaApi, GraphqlSdk } from '@yaha/gql-api';
import { getAllPaginatedData } from '@yaha/shared/graphql/api-client';
import {
  ExternalPoi,
  ExternalPoiFp,
  ExternalPoiServiceDeps,
  getExternalImages,
  getExternalPois,
  groupPoisOnSameLocation,
} from './external-poi';
import { HttpClient } from './http';
import {
  filterPointsCloseToReferencePoints,
  removePointsOutsideOfPolygon,
} from './geometry';
import { multipleGet, multipleWrite } from './data-service-utils';
import { Client as GoogleMapsClient } from '@googlemaps/google-maps-services-js';

const averageSpeed = 4; // KM/H

export interface ProcessRouteSegmentDeps {
  sdk: GraphqlSdk;
  googleApiKey: string;
  flickrApiKey: string;
  http: HttpClient;
  googleMapsClient: GoogleMapsClient;
}

export const processRouteSegment =
  (deps: ProcessRouteSegmentDeps) =>
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  (segmentCoords: Position[]): Observable<any> => {
    console.log('Entering processing...');

    const findPlaces =
      (bigBuffer: Feature<Polygon>) =>
      (objectType: YahaApi.GeoSearchableObjectType) =>
        getAllPaginatedData<YahaApi.SearchInShapeInput, string>(
          deps.sdk.SearchInShape,
          {
            variables: {
              query: {
                objectType,
                shape: {
                  type: 'polygon',
                  coordinates: bigBuffer.geometry.coordinates,
                },
              },
            },
          },
        );

    const findYahaPois = (bigBuffer: Feature<Polygon>) =>
      findPlaces(bigBuffer)(YahaApi.GeoSearchableObjectType.poi).pipe(
        switchMap(ids => multipleGet(deps.sdk.GetPoi)(ids.items)),
        map(pois => R.reject(R.isNil)(pois)),
      );

    const findYahaImages = (bigBuffer: Feature<Polygon>) =>
      findPlaces(bigBuffer)(YahaApi.GeoSearchableObjectType.image).pipe(
        switchMap(ids => multipleGet(deps.sdk.GetImage)(ids.items)),
        map(pois => R.reject(R.isNil)(pois)),
      );

    const externalPoisDeps: ExternalPoiServiceDeps = {
      googleApiKey: deps.googleApiKey,
      flickrApiKey: deps.flickrApiKey,
      http: deps.http,
    };

    return pipe(
      segmentCoords,
      RouteSegmentFp.fromCoordinatesWithElevation(averageSpeed),
      O.fold(() => throwError('Cannot calculate route segment'), of),
      map((segment: RouteSegment) => ({
        boundingBox: RouteSegmentFp.calculatePoiSearchBox(
          segment.geojsonFeature,
        ),
        bigBuffer: RouteSegmentFp.calculateBufferOfLine(EBuffer.BIG)(
          segment.geojsonFeature,
        ),
        smallBuffer: RouteSegmentFp.calculateBufferOfLine(EBuffer.SMALL)(
          segment.geojsonFeature,
        ),
      })),
      switchMap(state =>
        pipe(
          forkJoin([
            findYahaPois(state.bigBuffer),
            findYahaImages(state.bigBuffer),
          ]),
          map(([pois, images]) => ({
            ...state,
            pois: pois ?? [],
            images: images ?? [],
          })),
        ),
      ),
      switchMap(state =>
        pipe(
          forkJoin([
            getExternalPois(externalPoisDeps)(
              state.boundingBox,
              DESCRIPTION_LANGUAGES_SHORT,
              ExternalPoiFp.collectObjId(state.pois),
            ),
            getExternalImages(externalPoisDeps)(
              state.boundingBox,
              DESCRIPTION_LANGUAGES_SHORT,
              ExternalPoiFp.collectObjId(state.images),
            ),
          ]),
          map(([pois, images]) => ({
            ...state,
            externalPois: pois ?? [],
            externalImages: images ?? [],
          })),
        ),
      ),
      switchMap(state =>
        updateYahaPois(deps)(
          state.externalPois,
          state.externalImages,
          state.pois,
          state.images,
          state.bigBuffer,
          state.smallBuffer,
        ),
      ),
    );
  };

const updateYahaPois =
  (deps: ProcessRouteSegmentDeps) =>
  (
    externalPois: ExternalPoi[],
    externalImages: YahaApi.CreateImageInput[],
    poisInDb: YahaApi.Poi[],
    imagesInDb: YahaApi.Image[],
    searchPolygon: Feature<Polygon>,
    smallBuffer: Feature<Polygon>,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
  ): Observable<any> => {
    const yahaItemIds = fp.map(item => item.id, poisInDb);

    // Get the processed pois
    const externalPoisInBigBuffer =
      removePointsOutsideOfPolygon<ExternalPoi>(searchPolygon)(externalPois);

    const allPoisInBigBuffer = fp.concat(
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      poisInDb as any[],
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      externalPoisInBigBuffer as any[],
    );

    const groupedPois: (ExternalPoi | YahaApi.Poi)[] = groupPoisOnSameLocation(
      GtrackDefaults.distanceOfSamePoisInMeters(),
    )(allPoisInBigBuffer);

    // Get the new images
    const imagesInBigBuffer =
      removePointsOutsideOfPolygon<YahaApi.CreateImageInput>(searchPolygon)(
        externalImages,
      );

    const imagesCloseToPois = filterPointsCloseToReferencePoints<
      { location: { lat: number; lon: number } },
      YahaApi.CreateImageInput
    >(
      GtrackDefaults.distanceOfSamePoisInMeters(),
      groupedPois,
      imagesInBigBuffer,
    );

    const imagesInSmallBuffer =
      removePointsOutsideOfPolygon<YahaApi.CreateImageInput>(smallBuffer)(
        externalImages,
      );

    const imagesAreTheSame = (
      image1: { sourceObject: YahaApi.PoiSourceObject },
      image2: { sourceObject: YahaApi.PoiSourceObject },
    ): boolean => fp.isEqual(image1.sourceObject, image2.sourceObject);

    const newImages = fp.flow(
      fp.concat(imagesInSmallBuffer),
      newImages => fp.differenceWith(imagesAreTheSame, newImages, imagesInDb),
      fp.uniqWith(imagesAreTheSame),
    )(imagesCloseToPois);

    const saveNewImages = pipe(
      newImages,
      fp.filter(
        (image: YahaApi.CreateImageInput) =>
          !fp.includes(ImageFp.generateId(image), yahaItemIds),
      ),
      (reallyNewImages: YahaApi.CreateImageInput[]) =>
        fp.isEmpty(reallyNewImages)
          ? of(true)
          : multipleWrite<YahaApi.CreateImageInput, YahaApi.Image>(
              deps.sdk.CreateImage,
            )(reallyNewImages),
    );

    // Prepare pois for upsert
    const [poisToUpdate, newPois] = fp.partition(
      // eslint-disable-next-line @typescript-eslint/no-explicit-any
      (item: any) => !!item.id,
      groupedPois,
    );

    const poisAreTheSame = (poi1: YahaApi.Poi, poi2: YahaApi.Poi): boolean =>
      fp.isEqual(
        PoiFp.createPoiUpdateData(poi1),
        PoiFp.createPoiUpdateData(poi2),
      );

    const updatedPoisForDatabase = fp.flow(
      pois => fp.differenceWith(poisAreTheSame, pois, poisInDb),
      fp.map(PoiFp.createPoiUpdateData),
    )(poisToUpdate);

    const saveNewPois = pipe(
      newPois,
      fp.map(poi => ExternalPoiFp.convertToPoiInput(poi, 0)),
      getElevationOfPointsFromGoogle({
        apiKey: deps.googleApiKey,
        client: deps.googleMapsClient,
      }),
      switchMap(E.fold(err => throwError(err), of)),
      switchMap((pois: YahaApi.CreatePoiInput[]) =>
        multipleWrite<YahaApi.CreatePoiInput, YahaApi.Poi>(deps.sdk.CreatePoi)(
          pois,
        ),
      ),
    );

    const updateNewPois = multipleWrite<YahaApi.UpdatePoiInput, YahaApi.Poi>(
      deps.sdk.UpdatePoi,
    )(updatedPoisForDatabase);

    console.warn('Number of pois already found in YAHA:', poisInDb.length);
    console.warn('Number of images already found in YAHA:', imagesInDb.length);
    console.warn('Number of external pois to process:', externalPois.length);
    console.warn(
      'Number of external images to process:',
      externalImages.length,
    );
    console.warn('Number of new pois to save:', newPois.length);
    console.warn('Number of pois to update:', updatedPoisForDatabase.length);
    console.warn('Number of new images:', newImages.length);

    // Execute the database operations
    return forkJoin([saveNewPois, saveNewImages, updateNewPois]);
  };