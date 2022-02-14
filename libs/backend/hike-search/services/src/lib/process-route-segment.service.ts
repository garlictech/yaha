import { Position } from '@turf/helpers';
import * as E from 'fp-ts/lib/Either';
import * as O from 'fp-ts/lib/Option';
import * as A from 'fp-ts/lib/Array';

import * as fp from 'lodash/fp';
import { forkJoin, Observable, of, throwError } from 'rxjs';
import { tap, switchMap, take, map } from 'rxjs/operators';
import { pipe, flow } from 'fp-ts/lib/function';
import { Feature, Polygon } from '@turf/helpers';
import { GtrackDefaults } from '@bit/garlictech.universal.gtrack.defaults/defaults';
import { PoiFp } from '@bit/garlictech.universal.gtrack.poi';
import { getElevationOfPointsFromGoogle } from '@bit/garlictech.nodejs.shared.elevation';
import { ImageFp } from '@bit/garlictech.universal.gtrack.image';
import {
  RouteSegmentFp,
  RouteSegment,
  EBuffer,
} from '@bit/garlictech.universal.gtrack.route-segment';
import { resolveDataInPolygon } from './graphql-data';
import {DESCRIPTION_LANGUAGES_SHORT} from '@bit/garlictech.universal.gtrack.language/language.fp';
import {YahaApi} from '@yaha/gql-api';

const averageSpeed = 4; // KM/H

export interface ProcessRouteSegmentDeps {

}

export const processRouteSegment =(deps: ProcessRouteSegmentDeps) => (segmentCoords: Position[]): Observable<any> => {
    console.log('Entering processing...');

    const createPlaceResolvers = (bigBuffer: Feature<Polygon>) => [
      resolveDataInPolygon<YahaApi.Poi>({
        searchPolygon: bigBuffer,
        placeType: YahaApi.PlaceType.poi,
      })({
        graphqlClient: this.graphqlClient.backendClient,
        queryExecutor: params => this.poiApiService.api.getWithQuery(params),
      }),
      resolveDataInPolygon<Image>({
        searchPolygon: bigBuffer,
        placeType: PlaceType.image,
      })({
        graphqlClient: this.graphqlClient.backendClient,
        queryExecutor: params => this.imageApiService.api.getWithQuery(params),
      }),
    ];

    const updatePois =
      (
        boundingBox: BoundingBox,
        bigBuffer: Feature<Polygon>,
        smallBuffer: Feature<Polygon>,
      ) =>
      (gtrackPois: Array<Poi | Image>) =>
        this.externalPoiService
          .get(
            boundingBox,
            DESCRIPTION_LANGUAGES_SHORT,
            ExternalPoiFp.collectObjId(gtrackPois),
          )
          .pipe(
            switchMap(externalItems =>
              this.updateGtrackPois(
                externalItems,
                gtrackPois,
                bigBuffer,
                smallBuffer,
              ),
            ),
            take(1),
          );

    return validateCoordinatesWithElevation(segmentCoords).pipe(
      switchMap(
        flow(
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
          switchMap(({ bigBuffer, boundingBox, smallBuffer }) =>
            pipe(
              createPlaceResolvers(bigBuffer),
              forkJoin,
              map(flow(A.array.sequence(E.either), E.map(A.flatten))),
              switchMap(E.fold(err => throwError(err), of)),
              switchMap(updatePois(boundingBox, bigBuffer, smallBuffer)),
            ),
          ),
        ),
      ),
    );
  }

  private updateGtrackPois(
    externalItems: PoiSearchOutputType,
    itemsInDb: (Poi | Image)[],
    searchPolygon: Feature<Polygon>,
    smallBuffer: Feature<Polygon>,
  ): Observable<any> {
    const externalImages: CreateImageInput[] = fp.filter(
      isCreateImageInput,
      externalItems,
    ) as unknown as CreateImageInput[];

    const externalPois = fp.flow(
      fp.map((item: any) => ({ ...item, elevation: 0 })),
      fp.filter<Poi>(isCreatePoiInput),
    )(externalItems);

    const isGtrackPoi = (item: { id?: string; description?: unknown }) =>
      !!item.id && !!item.description;

    const gtrackItemIds = fp.map(item => item.id, itemsInDb);

    const filterExternalPoisInBuffer =
      (pois: Poi[]) =>
      (buffer: Feature<Polygon>): Poi[] =>
        pipe(
          pois,
          fp.remove<Poi>(isCreateImageInput),
          removePointsOutsideOfPolygon(buffer),
        );

    const filterGtrackPoisInBuffer = (buffer: Feature<Polygon>) =>
      fp.flow(fp.filter(isGtrackPoi), removePointsOutsideOfPolygon(buffer));

    // Get the processed pois
    const externalPoisInBigBuffer =
      filterExternalPoisInBuffer(externalPois)(searchPolygon);
    const gtrackPoisInBigBuffer =
      filterGtrackPoisInBuffer(searchPolygon)(itemsInDb);
    const allPoisInBigBuffer = fp.concat(
      gtrackPoisInBigBuffer,
      externalPoisInBigBuffer,
    );

    const groupedPois: (ExternalPoi | Poi)[] = groupPoisOnSameLocation(
      GtrackDefaults.distanceOfSamePoisInMeters(),
    )(allPoisInBigBuffer);

    // Get the new images
    const imagesInBigBuffer =
      removePointsOutsideOfPolygon(searchPolygon)(externalImages);

    const imagesCloseToPois = filterPointsCloseToReferencePoints(
      GtrackDefaults.distanceOfSamePoisInMeters(),
      groupedPois,
      imagesInBigBuffer,
    );

    const imagesInSmallBuffer =
      removePointsOutsideOfPolygon(smallBuffer)(externalImages);

    const newImages = fp.flow(
      fp.concat(imagesInSmallBuffer),
      fp.uniq,
    )(imagesCloseToPois);

    const saveNewImages = pipe(
      newImages,
      fp.filter(
        (image: CreateImageInput) =>
          !fp.includes(ImageFp.generateId(image), gtrackItemIds),
      ),
      (reallyNewImages: CreateImageInput[]) =>
        fp.isEmpty(reallyNewImages)
          ? of(true)
          : this.imageApiService.api.createMultipleItems(reallyNewImages),
    );

    // Prepare pois for upsert
    const [poisToUpdate, newPois] = fp.partition(
      (item: any) => !!item.id,
      groupedPois,
    );

    const poisAreTheSame = (poi1: Poi, poi2: Poi): boolean =>
      fp.isEqual(
        PoiFp.createPoiUpdateData(poi1),
        PoiFp.createPoiUpdateData(poi2),
      );

    const updatedPoisForDatabase = fp.flow(
      pois => fp.differenceWith(poisAreTheSame, pois, gtrackPoisInBigBuffer),
      fp.map(PoiFp.createPoiUpdateData),
    )(poisToUpdate);

    const saveNewPois = pipe(
      newPois,
      fp.map(poi => ExternalPoiFp.convertToPoiInput(poi, 0)),
      getElevationOfPointsFromGoogle,
      switchMap(E.fold(err => throwError(err), of)),
      switchMap((pois: CreatePoiInput[]) =>
        this.poiApiService.api.createMultipleItems(pois),
      ),
    );

    const updateNewPois = this.poiApiService.api.updateMultipleItems(
      updatedPoisForDatabase,
    );

    // Execute the database operations
    return forkJoin([saveNewPois, saveNewImages, updateNewPois]);
  }
  
