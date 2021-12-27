import { getSdk } from './generated/yaha-api';
import {
  getSdkRequester,
  SdkMethodMapper,
} from '@yaha/shared/graphql/api-client';
import { flow } from 'fp-ts/lib/function';

export const getSdkAmplify = flow(getSdkRequester, getSdk);

type RawSdk = ReturnType<typeof getSdkAmplify>;

export type GraphqlSdk = {
  [Method in keyof ReturnType<typeof getSdkAmplify>]: SdkMethodMapper<
    RawSdk,
    Method
  >;
};
