import 'package:graphql/client.dart';
import 'package:starred_github/configs/environment.dart';

GraphQLClient getGithubGraphQLClient() {
  final Link _link = HttpLink(
    'https://api.github.com/graphql',
    defaultHeaders: {
      'Authorization': 'Bearer $accessTokenGithub',
    },
  );

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}
