import 'package:starred_github/models/result_query.model.dart';
import 'package:starred_github/repositories/github.repository.dart';

import 'graphql/graphql_client.dart';

void main() async {
  print('start');

  final _client = getGithubGraphQLClient();

  final repository = GithubRepository(_client);
  try {
    final result = await repository.findUserByLogin("italo-patricio");
    final resultObject = ResultQueryUser.fromJson(result.data);
    print(resultObject.data);
  } catch (e) {
    print(e);
  }
  await Future.delayed(Duration(seconds: 2));
  try {
    final resultError = await repository.findUserByLogin("italopat");
    if (resultError.hasException) {
      print(resultError.exception.graphqlErrors.first.message);
    } else {
      final resultObjectError = ResultQueryUser.fromJson(resultError.data);
      print(resultObjectError.data);
    }
  } catch (e) {
    print(e);
  }
  await Future.delayed(Duration(seconds: 10));
}
