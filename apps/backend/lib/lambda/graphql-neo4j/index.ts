import { ApolloServer } from 'apollo-server-lambda';
import neo4j from 'neo4j-driver';

import * as neo4jGraphqlJs from 'neo4j-graphql-js';
const { makeAugmentedSchema } = neo4jGraphqlJs;

const typeDefs = `
type Kitteh {
  name: String
  cuteness: Int
}
`;

const schema = makeAugmentedSchema({ typeDefs });
const driver = neo4j.driver(
  'bolt://18.208.119.122:32864',
  neo4j.auth.basic('neo4j', 'floor-custody-directions'),
);

const server = new ApolloServer({
  schema,
  introspection: true,
  playground: {
    endpoint: '/dev/graphql',
  },
  context: { driver },
});

export const handler = server.createHandler();
