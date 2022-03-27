import axios from 'axios';
import { Observable, from, defer } from 'rxjs';
import { map } from 'rxjs/operators';

export interface HttpGetConfig {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  params: any;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type HttpClient = {
  get: <T>(url: string, config?: HttpGetConfig) => Observable<T>;
  post: <T>(url: string, data: unknown) => Observable<T>;
};

export class HttpClientImpl implements HttpClient {
  private static axiosInstance = axios.create();

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  get<T = any>(url: string, config?: HttpGetConfig): Observable<T> {
    return defer(() =>
      from(HttpClientImpl.axiosInstance.get(url, config)),
    ).pipe(map(response => response.data));
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  post<T = any>(url: string, data: unknown): Observable<T> {
    return defer(() => from(HttpClientImpl.axiosInstance.post(url, data))).pipe(
      map(response => response.data),
    );
  }
}
