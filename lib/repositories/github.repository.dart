import 'package:starred_github/models/result_query.model.dart';

const mockResultSuccess = {
  "data": {
    "user": {
      "name": "Italo ",
      "login": "italo-patricio",
      "company": "Elo7 @elo7 "
    }
  }
};

const mockResultError = {
  "data": {"user": null},
  "errors": [
    {
      "type": "NOT_FOUND",
      "message": "Could not resolve to a User with the login of 'italopa'."
    }
  ]
};

class GithubRepository {
  Future<ResultQueryUser> findUserByLogin(String login) async {
    await Future.delayed(Duration(milliseconds: 100));
    if (login == "italo-patricio") {
      return ResultQueryUser.fromJson(mockResultSuccess);
    } else {
      return ResultQueryUser.fromJson(mockResultError);
    }
  }
}
