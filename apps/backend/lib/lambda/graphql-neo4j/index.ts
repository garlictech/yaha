import fs from 'fs';
import { ApolloServer } from 'apollo-server-lambda';
import neo4j from 'neo4j-driver';
import { Neo4jGraphQL } from '@neo4j/graphql';

const driver = neo4j.driver(
  'bolt://52.91.166.161:7687',
  neo4j.auth.basic('neo4j', 'firefighting-drums-accomplishment'),
);

const schemaFilename = `${__dirname}/hiking-api.graphql`;

export const typeDefs = fs.readFileSync(schemaFilename).toString('utf-8');

const neoSchema = new Neo4jGraphQL({ typeDefs, driver });

const server = new ApolloServer({
  schema: neoSchema.schema,
  introspection: true,
  playground: {
    endpoint: '/graphql',
  },
  context: ({ req }) => ({ req }),
});

export const handler = server.createHandler();
