const { Neo4jGraphQL } = require('@neo4j/graphql');
const { ApolloServer } = require('apollo-server');
const neo4j = require('neo4j-driver');
const fs = require('fs');
const schemaFilename = `${__dirname}/hiking-api.graphql`;
const typeDefs = fs.readFileSync(schemaFilename).toString('utf-8');

console.log('Starting the server...');
// (You may need to replace your connection details, username and password)
const AURA_ENDPOINT = process.env.NEO4J_URI;
const USERNAME = process.env.NEO4J_USERNAME;
const PASSWORD = process.env.NEO4J_PASSWORD;

// Create Neo4j driver instance
const driver = neo4j.driver(
  AURA_ENDPOINT,
  neo4j.auth.basic(USERNAME, PASSWORD),
);

// Create instance that contains executable GraphQL schema from GraphQL type definitions
const neo4jGraphQL = new Neo4jGraphQL({
  typeDefs,
  driver,
});

// Generate schema
neo4jGraphQL.getSchema().then(schema => {
  // Create ApolloServer instance to serve GraphQL schema
  const server = new ApolloServer({
    schema,
    context: { driverConfig: { database: 'neo4j' } },
  });

  // Start ApolloServer
  server
    .listen({
      port: 4000,
    })
    .then(({ url }) => {
      console.log(`GraphQL server ready at ${url}`);
    });
});
