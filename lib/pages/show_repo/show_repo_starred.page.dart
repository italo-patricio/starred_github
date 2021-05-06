import 'package:flutter/material.dart';
import 'package:starred_github/models/github_user.model.dart';
import 'package:starred_github/repositories/github.repository.dart';

import 'show_repo_starred_controller.dart';

class ShowRepoStarredPage extends StatefulWidget {
  final GithubRepository repository;

  const ShowRepoStarredPage({Key key, @required this.repository})
      : super(key: key);
  @override
  _ShowRepoStarredPageState createState() => _ShowRepoStarredPageState();
}

class _ShowRepoStarredPageState extends State<ShowRepoStarredPage> {
  List<GithubUserModel> users;

  ShowRepoStarredController _showRepoStarredController;

  @override
  void initState() {
    super.initState();
    _showRepoStarredController =
        ShowRepoStarredController(githubRepository: widget.repository);
  }

  getArguments(context) {
    final argumentsNavigation = ModalRoute.of(context)?.settings?.arguments;

    if (argumentsNavigation != null) {
      _showRepoStarredController.searchUserByLogin(argumentsNavigation);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    getArguments(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositórios Estrelados"),
      ),
      body: StreamBuilder<GithubUserModel>(
          stream: _showRepoStarredController.userStream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            GithubUserModel userModel = snapshot.data;

            if (userModel.starredRepositories == null) {
              return Center(
                child: Text("Nada encontrado!"),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount:
                        userModel.starredRepositories?.repos?.length ?? 0,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      final starredRepo =
                          userModel.starredRepositories.repos[index];
                      return ListTile(
                        title: Text('${starredRepo.name}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${starredRepo.description}'),
                            Text(
                              'Favoritos ${starredRepo.stargazerCount}',
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (_, index) {
                      return Divider();
                    },
                  ),
                )
              ],
            );
          }),
    );
  }
}
