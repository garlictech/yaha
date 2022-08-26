import * as AWS from 'aws-sdk';
import * as fp from 'lodash/fp';
import * as fs from 'fs';
import { flow, pipe } from 'fp-ts/lib/function';
import { map } from 'rxjs/operators';
import { GetParametersRequest, GetParametersResult } from 'aws-sdk/clients/ssm';
import { bindNodeCallback, Observable, combineLatest } from 'rxjs';

const region = process.env.AWS_REGION;
const client = new AWS.SSM({ region });
const environment = process.argv[2];
const targetDir = `${__dirname}/../libs/shared/config/src/lib/generated`;
const targetFile = `${targetDir}/config.json`;

const amplifyMetaConfigFile = `${__dirname}/../apps/amplify-app/amplify/backend/amplify-meta.json`;
//const mobileAppConfigurationFile = `${__dirname}/../apps/mobile_app/lib/awsconfiguration.dart`;

//--- Read generated crud amplify backend (meta-) config
/*const amplifyConfig = JSON.parse(
  fs.readFileSync(amplifyMetaConfigFile, 'utf8'),
);
*/
fs.mkdirSync(targetDir, { recursive: true });

const prefix = `${environment}-yaha`;

const generatedParams = [
  'IdentityPoolId',
  'ConsumerWebUserPoolClientId',
  'ConsumerUserPoolDomain',
  'ConsumerUserPoolId',
  'Neo4jOsmEndpoint',
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
    ),
  ),
).subscribe();
