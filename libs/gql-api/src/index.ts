import awsmobile from './lib/generated/aws-exports';
import * as tableConfig from './lib/generated/table-config.json';
import * as YahaApi from './lib/generated/yaha-api';

export * from './lib/clients';
export * from './lib/sdk';
export * from './lib/generated/models';
export { tableConfig, awsmobile as awsConfig, YahaApi };
