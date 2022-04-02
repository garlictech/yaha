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

/*axios.interceptors.request.use(
  function (config) {
    // Do something before request is sent
    console.log(config);
    return config;
  },
  function (error) {
    // Do something with request error
    return Promise.reject(error);
  },
);
*/
export class HttpClientImpl implements HttpClient {
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  get<T = any>(url: string, config?: HttpGetConfig): Observable<T> {
    return defer(() => from(axios.get(url, config))).pipe(
      map(response => response.data),
    );
  }

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  post<T = any>(url: string, data: unknown): Observable<T> {
    return defer(() => from(axios.post(url, data))).pipe(
      map(response => response.data),
    );
  }
}
