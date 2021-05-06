import 'package:graphql/client.dart';

import 'queries/user_query.dart';

class GithubRepository {
  final GraphQLClient _graphqlClient;

  GithubRepository(this._graphqlClient);

  Future<QueryResult> findUserByLogin(String login) async {
    final queryOptions = QueryOptions(
      document: gql(getRepoByUserQuery),
      variables: <String, String>{'login': login},
    );
    return await this._graphqlClient.query(queryOptions);
  }
}
