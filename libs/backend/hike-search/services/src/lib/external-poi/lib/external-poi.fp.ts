import { ExternalPoi } from './types';

export class ExternalPoiFp {
  static collectUrls = (poi: ExternalPoi): string | undefined | null =>
    poi.infoUrl;

  static thumbnailImageWidth(): number {
    return 320;
  }

  static cardImageWidth(): number {
    return 640;
  }
}
