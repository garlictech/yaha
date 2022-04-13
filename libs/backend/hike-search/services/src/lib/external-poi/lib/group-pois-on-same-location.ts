import { YahaApi } from '@yaha/gql-api';
import { pipe } from 'fp-ts/lib/function';
import {
  cloneDeep,
  concat as _concat,
  filter,
  flatten,
  intersection,
  isEmpty,
  isEqual,
  map as _map,
  pull,
  pullAll,
  slice,
  uniq,
  uniqWith,
  without,
} from 'lodash';
import * as fp from 'lodash/fp';
import { approximateDistance } from '../../geometry';
import * as R from 'ramda';

function indexPoiPairsByDistance<
  POINT extends { location: { lat: number; lon: number } },
>(points: POINT[]): { distance: number; point1: POINT; point2: POINT }[] {
  const indexedPairsbyDistance = _map(points, (point1, index) => {
    const processedPoisRemoved = slice(points, index + 1);
    return _map(processedPoisRemoved, point2 => ({
      distance: approximateDistance(point1.location, point2.location),
      point1,
      point2,
    }));
  });

  return fp.sortBy(['distance'], fp.flatten(indexedPairsbyDistance));
}

/*const mergeSourceObjects = (
  pois: YahaApi.Poi[],
  targetPoi: YahaApi.Poi,
): YahaApi.PoiSourceObject[] =>
  fp.flow(
    fp.map('sourceObject'),
    fp.flatten,
    fp.concat(targetPoi.sourceObject),
    fp.reverse,
    fp.uniqWith(fp.isEqual),
  )(pois);
*/
export const mergePois = (
  pois: YahaApi.Poi[],
  targetPoi: YahaApi.Poi,
): YahaApi.Poi => ({
  ...targetPoi,
  sourceObject: targetPoi.sourceObject,
  //sourceObject: mergeSourceObjects(pois, targetPoi),
  description: uniqWith(
    uniqWith(
      flatten(_concat(targetPoi.description, fp.map('description')(pois))),
      isEqual,
    ),
    (desc1, desc2) => desc1.languageKey === desc2.languageKey,
  ),
  types: filter(
    uniq(flatten(_concat(targetPoi.types, fp.map('types')(pois)))),
    item => !!item,
  ),
});

export function groupPoisOnSameLocation(minimalDistanceInMeters: number) {
  return (pois: YahaApi.Poi[]): YahaApi.Poi[] => {
    let newPois: YahaApi.Poi[] = cloneDeep(pois);
    // create poi pairs indexed with their distance
    const indexedPairs = indexPoiPairsByDistance(newPois);
    let pairsCloseToEachOther = filter(
      indexedPairs,
      pair => pair.distance < minimalDistanceInMeters,
    );

    const findAndMergeClosePois = () => {
      const targetPoi = pairsCloseToEachOther[0].point1;
      let pickedPois = [targetPoi, pairsCloseToEachOther[0].point2];
      let pickedPairs = [pairsCloseToEachOther[0]];
      const wrapperFn = (points: YahaApi.Poi[]) =>
        indexPoiPairsByDistance(points);
      let pairsInRelationWithAPicked: ReturnType<typeof wrapperFn>;

      do {
        pairsInRelationWithAPicked = filter(
          pairsCloseToEachOther,
          pointToCheck =>
            !isEmpty(
              intersection(pickedPois, [
                pointToCheck.point1,
                pointToCheck.point2,
              ]),
            ),
        );

        pickedPairs = uniq(pickedPairs.concat(pairsInRelationWithAPicked));

        pickedPois = pipe(
          pairsInRelationWithAPicked.map(pair => [pair.point1, pair.point2]),
          fp.flatten,
          R.concat(pickedPois),
          fp.uniq,
        );

        pairsCloseToEachOther = pullAll(
          pairsCloseToEachOther,
          pairsInRelationWithAPicked,
        );
      } while (!isEmpty(pairsInRelationWithAPicked));

      const poisToMerge = without(pickedPois, targetPoi);

      if (!isEmpty(poisToMerge)) {
        const mergedPoi = mergePois(poisToMerge, targetPoi);
        newPois.push(mergedPoi);
        newPois = pull(newPois, targetPoi);
      }

      newPois = pullAll(newPois, poisToMerge);
    };

    while (!isEmpty(pairsCloseToEachOther)) {
      findAndMergeClosePois();
    }

    return newPois;
  };
}
