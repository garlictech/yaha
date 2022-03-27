import * as fp from 'lodash/fp';
import { from, Observable } from 'rxjs';
import { filter, map, switchMap } from 'rxjs/operators';
import { YahaApi } from '@yaha/gql-api';

export class ImageFp {
  static randomImageBackground(
    imageProvider$: Observable<YahaApi.Image[]>,
  ): Observable<{
    thumbnailUrl: string;
    fullsizeUrl: string;
  }> {
    return imageProvider$.pipe(
      switchMap(() => imageProvider$),
      filter(images => fp.isArray(images) && !fp.isEmpty(images)),
      map(
        fp.flow(
          fp.filter((image: YahaApi.Image) => !image.banned),
          fp.map(image => ({
            fullsizeUrl: image.card.url,
            thumbnailUrl: image.thumbnail.url,
          })),
        ),
      ),
      filter(images => fp.isArray(images) && !fp.isEmpty(images)),
      switchMap(urls => from(fp.shuffle(urls))),
    );
  }

  static generateId(image: YahaApi.CreateImageInput): string {
    return `${fp.get('sourceObject.objectType', image)}-${fp.get(
      'sourceObject.objectId',
      image,
    )}`;
  }
}
