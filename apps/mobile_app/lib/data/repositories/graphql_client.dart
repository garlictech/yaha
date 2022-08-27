import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

final geoCalcProvider = Provider<GraphQLClient>((ref) {
  final _httpLink = HttpLink(
    'http://graphql',
  );

  final _authLink = AuthLink(
    getToken: () async => 'Bearer $YOUR_PERSONAL_ACCESS_TOKEN',
  );

  Link _link = _authLink.concat(_httpLink);

  /// subscriptions must be split otherwise `HttpLink` will. swallow them
  if (websocketEndpoint != null) {
    final _wsLink = WebSocketLink(websockeEndpoint);
    _link = Link.split((request) => request.isSubscription, _wsLink, _link);
  }

  final GraphQLClient client = GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: _link,
  );
});
