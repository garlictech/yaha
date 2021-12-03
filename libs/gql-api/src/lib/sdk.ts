import { getSdk } from './generated/yaha-api';
import { getSdkRequester, SdkMethodMapper } from '@yaha/graphql/api-client';
import { flow } from 'fp-ts/lib/function';

export const getSdkAmplify = flow(getSdkRequester, getSdk);

type RawCrudSdk = ReturnType<typeof getSdkAmplify>;

export type CrudSdk = {
  [Method in keyof ReturnType<typeof getSdkAmplify>]: SdkMethodMapper<
    RawCrudSdk,
    Method
  >;
};
