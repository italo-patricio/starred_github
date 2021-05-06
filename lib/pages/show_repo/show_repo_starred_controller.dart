import 'dart:async';

import 'package:starred_github/models/github_user.model.dart';
import 'package:starred_github/repositories/github.repository.dart';

class ShowRepoStarredController {
  final GithubRepository githubRepository;

  ShowRepoStarredController({this.githubRepository});

  final _userStreamController = StreamController<GithubUserModel>();
  StreamSink get _userSink => _userStreamController.sink;
  Stream<GithubUserModel> get userStream => _userStreamController.stream;

  searchUserByLogin(String login) async {
    final queryResult = await githubRepository.findUserByLogin(login);
    if (queryResult.hasException) {
      _userSink.addError(queryResult.exception.graphqlErrors.first.message);
    } else {
      final object = GithubUserModel.fromJson(queryResult.data['user']);
      _userSink.add(object);
    }
  }
}
