import 'package:flutter/material.dart';
import 'package:starred_github/constants/routes_const.dart';

import 'graphql/graphql_client.dart';
import 'pages/search_user/search_user.page.dart';
import 'pages/show_repo/show_repo_starred.page.dart';
import 'repositories/github.repository.dart';

void main() async {
  final _client = getGithubGraphQLClient();
  final repository = GithubRepository(_client);

  // runPlayground();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(),
    initialRoute: RoutesConst.SEARCH_USER,
    routes: {
      RoutesConst.SEARCH_USER: (_) => SearchUserPage(
            repository: repository,
          ),
      RoutesConst.SHOW_REPO: (_) => ShowRepoStarredPage(
            repository: repository,
          ),
    },
  ));
}
