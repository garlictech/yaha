import * as AWS from 'aws-sdk';
import * as fp from 'lodash/fp';
import * as fs from 'fs';
import { flow, pipe } from 'fp-ts/lib/function';
import { map } from 'rxjs/operators';
import { GetParametersRequest, GetParametersResult } from 'aws-sdk/clients/ssm';
import { bindNodeCallback, Observable, combineLatest } from 'rxjs';

const region = process.env.AWS_REGION;
const client = new AWS.SSM({ region });
const project = process.argv[2];
const stage = process.argv[3];
const prefix = `${stage}-${project}`;

const targetDir = `${__dirname}/../libs/shared/config/src/lib/generated`;
const targetFile = `${targetDir}/config.json`;
const mobileAppConfigurationFile = `${__dirname}/../apps/yaha-mobile/lib/awsconfiguration.dart`;

fs.mkdirSync(targetDir, { recursive: true });

const generatedParams = [
  'YahaGraphqlApiKey',
  'YahaGraphqlApiUrl',
  'IdentityPoolId',
  'ConsumerWebUserPoolClientId',
  'ConsumerUserPoolDomain',
  'ConsumerUserPoolId',
].map(paramName => `/${prefix}/generated/${paramName}`);

const fixParams = ['GoogleApiKey', 'FlickrApiKey'].map(
  paramName => `/${prefix}/${paramName}`,
);

pipe(
  [...generatedParams, ...fixParams],
  // We need to do this because the stuff can query max 10 parameters in one request
  fp.chunk(10),
  fp.map(
    flow(
      paramNames =>
        bindNodeCallback((params: GetParametersRequest, callback: any) =>
          client.getParameters(params, callback),
        )({ Names: paramNames }) as Observable<GetParametersResult>,
    ),
  ),
  x => combineLatest(x),
  map(
    flow(
      fp.map(
        flow(
          pars => pars.Parameters || [],
          fp.map(param => [
            pipe(param.Name, fp.split('/'), fp.last),
            param.Value,
          ]),
        ),
      ),
      fp.flatten,
      fp.fromPairs,
      fp.tap(config => {
        console.log(config);
        config['Region'] = region;
        fs.writeFileSync(targetFile, JSON.stringify(config, null, 2));
        console.log(`Config written to ${targetFile}`);
      }),
      fp.tap(config => {
        config['Region'] = region;
        config['Stage'] = stage;
        console.log(config);

        fs.writeFileSync(
          mobileAppConfigurationFile,
          `const AWSCONFIG = '''${JSON.stringify(config, null, 2)}''';`,
        );
        console.log(
          `Mobile application config written to ${mobileAppConfigurationFile}`,
        );
      }),
    ),
  ),
).subscribe();
