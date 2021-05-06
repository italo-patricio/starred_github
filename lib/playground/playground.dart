import 'package:starred_github/graphql/graphql_client.dart';
import 'package:starred_github/models/result_query.model.dart';
import 'package:starred_github/repositories/github.repository.dart';

runPlayground() async {
  final _client = getGithubGraphQLClient();

  final repository = GithubRepository(_client);
  List<GithubUserModel> resultObjects = [];
  try {
    final result = await repository.findUsersBySearch("italo ");
    if (result.hasException) {
      print(result.exception);
    } else {
      final resultNodes = result.data['search']['nodes'] as List;

      resultObjects.addAll(resultNodes.map((e) => GithubUserModel.fromJson(e)));
      print(resultObjects);
    }
  } catch (e) {
    print(e);
  }
  await Future.delayed(Duration(seconds: 2));
  try {
    final resultByLogin =
        await repository.findUserByLogin(resultObjects.first.login);
    if (resultByLogin.hasException) {
      print(resultByLogin.exception.graphqlErrors.first.message);
    } else {
      final resultObjectByLogin =
          GithubUserModel.fromJson(resultByLogin.data['user']);
      print(resultObjectByLogin);
    }
  } catch (e) {
    print(e);
  }
  await Future.delayed(Duration(seconds: 10));
}
