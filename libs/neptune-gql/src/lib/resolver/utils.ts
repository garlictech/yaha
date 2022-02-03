import * as gremlin from 'gremlin';

const connection: {
  conn?: gremlin.driver.DriverRemoteConnection;
  g?: gremlin.process.GraphTraversalSource;
  url?: string;
} = {};

export interface NeptuneResolverDeps {
  connection: typeof connection;
}

const traversal = gremlin.process.AnonymousTraversalSource.traversal;
const DriverRemoteConnection = gremlin.driver.DriverRemoteConnection;

const createRemoteConnection = (url: string) => {
  const c = new DriverRemoteConnection(url, {
    mimeType: 'application/vnd.gremlin-v2.0+json',
  });

  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  c.addListener('close', (code: any, message: any) => {
    console.info(`close - ${code} ${message}`);
    if (code == 1006) {
      console.error('Connection closed prematurely');
      throw new Error('Connection closed prematurely');
    }
  });

  return c;
};

const createGraphTraversalSource = (
  conn: gremlin.driver.DriverRemoteConnection,
) => {
  return traversal().withRemote(conn);
};

export const createNeptuneDeps = (
  neptuneWriterUrl: string,
): NeptuneResolverDeps => {
  const url = `wss://${neptuneWriterUrl}/gremlin`;
  connection.url = url;

  console.debug('Neptune URL: ', url);

  if (connection.conn === undefined) {
    console.info('Initializing NEPTUNE connection');
    connection.conn = createRemoteConnection(url);
    connection.g = createGraphTraversalSource(connection.conn);
  }

  return { connection };
};
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const handleProcessingError = (error: any): boolean => {
  // Add filters here to determine whether error can be retried
  console.warn('Determining whether retriable error: ' + error?.message);

  // Check for connection issues
  if (error?.message?.startsWith('WebSocket is not open') && connection.url) {
    console.warn('Reopening connection');
    connection.conn?.close();
    connection.conn = createRemoteConnection(connection.url);
    connection.g = createGraphTraversalSource(connection.conn);
    return true;
  }
  // Check for ConcurrentModificationException
  if (error?.message?.includes('ConcurrentModificationException')) {
    console.warn('Retrying query because of ConcurrentModificationException');
    return true;
  }

  // Check for ReadOnlyViolationException
  if (error?.message?.includes('ReadOnlyViolationException')) {
    console.warn('Retrying query because of ReadOnlyViolationException');
    return true;
  }

  return false;
};
