from node:18-alpine

WORKDIR /usr/app
RUN npm install @neo4j/graphql graphql apollo-server neo4j-driver

ADD server.js /usr/app/

ENTRYPOINT ["node", "./server.js"]
