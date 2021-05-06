import 'package:flutter/material.dart';
import 'package:starred_github/constants/routes_const.dart';
import 'package:starred_github/pages/search_user.page.dart';
import 'package:starred_github/pages/show_repo_starred.page.dart';

import 'graphql/graphql_client.dart';
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
      RoutesConst.SHOW_REPO: (_) => ShowRepoStarredPage(),
    },
  ));
}
