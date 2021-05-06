import 'starred_repository.model.dart';

class GithubUserModel {
  String name;
  String login;
  String avatarUrl;
  String bio;
  String location;
  String email;
  String url;
  StarredRepositoryModel starredRepositories;

  GithubUserModel({this.login});

  GithubUserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['name'];
    avatarUrl = json['avatarUrl'];
    bio = json['bio'];
    location = json['location'];
    email = json['email'];
    url = json['url'];
    if (hasStarredRepositories(json)) {
      starredRepositories =
          StarredRepositoryModel.fromJson(json['starredRepositories']);
    }
  }

  @override
  String toString() {
    return "$name ($login) - $email";
  }

  bool hasStarredRepositories(Map<String, dynamic> json) {
    return json['starredRepositories'] != null;
  }
}
