import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

final graphqlApiDomainNameProvider = Provider<String>(
    (_) => '38uhprq7de.execute-api.us-east-1.amazonaws.com/prod/');

final graphqlClientProvider = Provider<GraphQLClient>((ref) {
  final graphqlApiDomainName = ref.read(graphqlApiDomainNameProvider);

  final httpLink = HttpLink('https://$graphqlApiDomainName');

//  final authLink = AuthLink(getToken: () async => 'Bearer lofasz');

  //Link link = authLink.concat(httpLink);

  final wsLink = WebSocketLink('wss://$graphqlApiDomainName');
  Link link = Link.split((request) => request.isSubscription, wsLink, httpLink);

  return GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: link,
  );
});
