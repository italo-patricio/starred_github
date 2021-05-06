import 'package:flutter/material.dart';
import 'package:starred_github/models/result_query.model.dart';

class ShowRepoStarredPage extends StatefulWidget {
  @override
  _ShowRepoStarredPageState createState() => _ShowRepoStarredPageState();
}

class _ShowRepoStarredPageState extends State<ShowRepoStarredPage> {
  List<GithubUserModel> users;

  @override
  void initState() {
    super.initState();
    users = List.generate(
        10,
        (index) => GithubUserModel.fromJson({
              "name": "Italo $index",
              "login": "italo-patricio",
              "avatarUrl":
                  "https://avatars.githubusercontent.com/u/4944749?u=a64253a4395752b285b2f1dc7d5990c1f3ae83f5&v=4",
              "bio": "$index",
              "location": "Natal-RN",
              "email": "italopatriciosouza@hotmail.com",
              "url": "https://github.com/italo-patricio"
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositórios Estrelados"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
