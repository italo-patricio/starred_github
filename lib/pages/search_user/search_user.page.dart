import 'package:flutter/material.dart';
import 'package:starred_github/constants/routes_const.dart';
import 'package:starred_github/models/github_user.model.dart';

import 'package:starred_github/repositories/github.repository.dart';

import 'search_user_controller.dart';

class SearchUserPage extends StatefulWidget {
  final GithubRepository repository;

  const SearchUserPage({Key key, @required this.repository}) : super(key: key);
  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  String search;

  SearchUserController _searchUserController;

  @override
  void initState() {
    super.initState();
    _searchUserController =
        SearchUserController(githubRepository: widget.repository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Busca de usuários"),
        actions: [],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Insira o nome ou apelido do usuário",
              ),
              onSubmitted: _searchUserController.searchUser,
            ),
          ),
          SizedBox(height: 8),
          StreamBuilder<List<GithubUserModel>>(
              stream: _searchUserController.listUserStream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }

                if (!snapshot.hasData) {
                  return Center(
                    child: Text("Nada para exibir!"),
                  );
                }

                List<GithubUserModel> users = snapshot.data;

                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: users.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      final user = users[index];
                      return ListTile(
                          leading: Image.network(user.avatarUrl),
                          title: Text('${user.name}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              showInfoInlineWithLabel('Bio: ', user.bio),
                              showInfoInlineWithLabel('Email: ', user.email),
                              showInfoInlineWithLabel('Local: ', user.location),
                              showInfoInlineWithLabel('Url: ', user.url),
                            ],
                          ),
                          trailing: TextButton(
                            child: Text("Repositórios\nEstrelados"),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RoutesConst.SHOW_REPO,
                                  arguments: user.login);
                            },
                          ));
                    },
                    separatorBuilder: (_, index) {
                      return Divider();
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }

  RichText showInfoInlineWithLabel(String label, String value) {
    return RichText(
      text: TextSpan(style: TextStyle(color: Colors.black45), children: [
        TextSpan(text: "$label", style: TextStyle(fontWeight: FontWeight.bold)),
        TextSpan(text: "$value"),
      ]),
    );
  }
}
