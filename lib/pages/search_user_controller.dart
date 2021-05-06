import 'dart:async';

import 'package:starred_github/models/result_query.model.dart';
import 'package:starred_github/repositories/github.repository.dart';

class SearchUserController {
  final GithubRepository githubRepository;

  SearchUserController({this.githubRepository});

  final _listUsersStreamController = StreamController<List<GithubUserModel>>();
  StreamSink get _listUserSink => _listUsersStreamController.sink;
  Stream<List<GithubUserModel>> get listUserStream =>
      _listUsersStreamController.stream;

  searchUser(String search) async {
    final queryResult = await githubRepository.findUsersBySearch(search);
    if (queryResult.hasException) {
      _listUserSink.addError(queryResult.exception.graphqlErrors.first.message);
    } else {
      final resultNodes = queryResult.data['search']['nodes'] as List;
      final objects =
          resultNodes.map((e) => GithubUserModel.fromJson(e)).toList();
      _listUserSink.add(objects);
    }
  }
}
