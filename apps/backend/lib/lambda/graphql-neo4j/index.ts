import fs from 'fs';
import { ApolloServer } from 'apollo-server-lambda';
import neo4j from 'neo4j-driver';
import { Neo4jGraphQL } from '@neo4j/graphql';

const neo4jUsername = process.env.NEO4J_USERNAME || '';
const neo4jPassword = process.env.NEO4J_PASSWORD || '';
const neo4jUri = process.env.NEO4J_URI || '';

const driver = neo4j.driver(
  neo4jUri,
  neo4j.auth.basic(neo4jUsername, neo4jPassword),
);

console.log(
  'Connecting to neo4j server ',
  neo4jUri,
  neo4jUsername,
  neo4jPassword,
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
  context: { driver, driverConfig: { database: 'yahaosm' } },
});

export const handler = server.createHandler();
