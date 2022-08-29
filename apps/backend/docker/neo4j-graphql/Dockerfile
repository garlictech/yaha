from node:18-alpine

WORKDIR /usr/app
RUN npm install @neo4j/graphql graphql apollo-server neo4j-driver

ADD server.js healthcheck.js hiking-api.graphql /usr/app/

HEALTHCHECK --interval=12s --timeout=12s --start-period=30s \  
    CMD node healthcheck.js

ENTRYPOINT ["node", "./server.js"]
