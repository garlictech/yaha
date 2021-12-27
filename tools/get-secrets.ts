import * as AWS from 'aws-sdk';
import { pipe } from 'fp-ts/lib/function';
import * as fp from 'lodash/fp';
import * as fs from 'fs';

const project = 'yaha';
const environment = process.argv[2];

const secretEnvironment = ['dev', 'qa', 'staging', 'prod'].includes(environment)
  ? environment
  : 'dev';

const secretName = `${project}-${secretEnvironment}-secrets`;
const targetDir = `${__dirname}/../libs/shared/config/src/lib/generated`;
//const androidKeyStoreTargetFile = `${__dirname}/../apps/yaha/android/yaha-keystore.jks`;
//const androidKeyPropertiesTargetFile = `${__dirname}/../apps/yaha/android/key.properties`;

const client = new AWS.SecretsManager({
  region: process.env.AWS_REGION,
});

fs.mkdirSync(targetDir, { recursive: true });
client.getSecretValue({ SecretId: secretName }, function (err, data) {
  if (err || !data?.SecretString) {
    console.error('Secret error', err);
  } else {
    pipe(
      data.SecretString,
      JSON.parse,
      fp.tap(_secret => {
        // Android keystore binary
        /*fs.writeFileSync(androidKeyStoreTargetFile, secret.androidKeyStore, {
          encoding: 'base64',
        });

        // Android keystore binary
        fs.writeFileSync(androidKeyStoreTargetFile, secret.androidKeyStore, {
          encoding: 'base64',
        });
        console.log(`Secret config written to ${androidKeyStoreTargetFile}`);

        // Android key properties (key alias, password, path etc...)
        fs.writeFileSync(
          androidKeyPropertiesTargetFile,
          secret.androidKeyProperties,
          { encoding: 'base64' },
        );
        console.log(
          `Secret config written to ${androidKeyPropertiesTargetFile}`,
        );
        */
      }),
    );
  }
});
