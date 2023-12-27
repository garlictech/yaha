// ############
// execute with:
// yarn ts-node --project ./tools/tsconfig.tools.json -r tsconfig-paths/register ./tools/tag-untagged-images.ts
import { tagUntaggedImages } from '../libs/content/src';
import { neo4jDeps } from './utils/neo4j-utils';

tagUntaggedImages(neo4jDeps).subscribe(x => {
  console.log(`FINITO 👯‍♀️`);
  neo4jDeps.driver.close();
});
