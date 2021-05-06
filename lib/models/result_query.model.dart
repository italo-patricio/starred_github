import 'package:starred_github/repositories/github.repository.dart';

class GithubUserModel {
  String login;
  String name;
  String company;

  GithubUserModel({this.login});

  GithubUserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['email'];
    company = json['company'];
  }
}

class ResultQueryUser {
  GithubUserModel data;
  List<Errors> errors;

  ResultQueryUser({this.data, this.errors});

  ResultQueryUser.fromJson(Map<String, dynamic> json) {
    if (json == null) return;

    if (hasDataAndUser(json)) {
      data = GithubUserModel.fromJson(json['data']['user']);
    }
    if (hasError(json)) {
      errors = <Errors>[];
      json['errors'].forEach((v) {
        errors.add(Errors.fromJson(v));
      });
    }
  }

  bool hasDataAndUser(Map<String, dynamic> json) {
    return json['data'] != null && json['data']['user'] != null;
  }

  bool hasError(Map<String, dynamic> json) {
    return json['errors'] != null;
  }
}

class Errors {
  String type;
  String message;

  Errors({this.type, this.message});

  Errors.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
  }
}
