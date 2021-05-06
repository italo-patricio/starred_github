import 'package:starred_github/models/result_query.model.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:starred_github/repositories/queries/user_query.dart';

class GithubRepository {
  final HasuraConnect _hasuraConnect;

  GithubRepository(this._hasuraConnect);

  Future<ResultQueryUser> findUserByLogin(String login) async {
    final result = await this._hasuraConnect.query(getRepoByUserQuery);
    return ResultQueryUser.fromJson(result);
  }
}
