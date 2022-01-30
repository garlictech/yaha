import { Handler } from 'aws-lambda';
import { from, throwError } from 'rxjs';
import { NestFactory } from '@nestjs/core';
import { catchError, take, tap, map, switchMap, mapTo } from 'rxjs/operators';
import { Logger } from '@bit/garlictech.nodejs.shared.bunyan-logger';
import { ProcessRouteSegmentService } from './process-route-segment.service';
import { ProcessRouteSegmentModule } from './process-route-segment.module';

export const handler: Handler = (event: any) => {
  Logger.info(`Processing started`);

  return from(NestFactory.createApplicationContext(ProcessRouteSegmentModule))
    .pipe(
      map(app => app.get(ProcessRouteSegmentService)),
      take(1),
      switchMap((service: ProcessRouteSegmentService) =>
        service.process(event.arguments),
      ),
      tap(() => {
        Logger.info('Excution finished');
      }),
      mapTo(true),
      catchError(err => {
        Logger.info('Excution failed');
        Logger.debug(JSON.stringify(err, null, 2));
        return throwError(err);
      }),
    )
    .toPromise();
};
