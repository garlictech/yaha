//
// EXECUTE: yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/fetch-turistautak-neo4j.ts
//
/* eslint no-console: "off" */
import { priveteIds, processHikes } from './utils/neo4j-utils';

processHikes('private', priveteIds).subscribe();
