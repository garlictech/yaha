import { Neo4jGraphQL } from '@neo4j/graphql';
import { ApolloServer, gql } from 'apollo-server-lambda';
import { Handler } from 'aws-lambda';
import fs from 'fs';
import neo4j from 'neo4j-driver';

const neo4jUsername = process.env.NEO4J_USERNAME || '';
const neo4jPassword = process.env.NEO4J_PASSWORD || '';
const neo4jUri = process.env.NEO4J_URI || '';

console.log(neo4jUsername, neo4jPassword, neo4jUri);

const driver = neo4j.driver(
  neo4jUri,
  neo4j.auth.basic(neo4jUsername, neo4jPassword),
);

console.log('Connecting to neo4j server ', neo4jUri);

//const schemaFilename = `${__dirname}/hiking-api.graphql`;

const typeDefs = gql`
  type Person {
    name: String
    knows: [Person!]! @relationship(type: "KNOWS", direction: OUT)
    friendCount: Int
      @cypher(statement: "RETURN SIZE((this)-[:KNOWS]->(:Person))")
  }
`;

//export const typeDefs = fs.readFileSync(schemaFilename).toString('utf-8');

const neoSchema = new Neo4jGraphQL({ typeDefs, driver });

const initServer = async () => {
  const schema = await neoSchema.getSchema();
  console.log('**** SCHEMA', schema);
  const server = new ApolloServer({
    schema,
    context: ({ event }) => ({
      req: event,
    }),
    introspection: true,
  });
  return server.createHandler();
};

export const handler: Handler = async (event, context, callback) => {
  const serverHandler = await initServer();

  return (
    serverHandler(
      {
        ...event,
        requestContext: context,
      },
      context,
      callback,
    ) as any
  ).catch((err: any) => console.log(' (*****)', err));
};
