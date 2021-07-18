import { ApolloServer } from 'apollo-server-lambda';
import neo4j from 'neo4j-driver';
import { Neo4jGraphQL } from '@neo4j/graphql';

const typeDefs = `
type Kitteh {
  name: String
  cuteness: Int
}
`;

const driver = neo4j.driver(
  'bolt://18.207.184.118:7687',
  neo4j.auth.basic('neo4j', 'noise-blankets-balloon'),
);

const neoSchema = new Neo4jGraphQL({ typeDefs, driver });

const server = new ApolloServer({
  schema: neoSchema.schema,
  introspection: true,
  playground: {
    endpoint: '/dev/graphql',
  },
  context: ({ req }) => ({ req }),
});

export const handler = server.createHandler();
