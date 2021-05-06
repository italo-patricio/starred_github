class GithubUserModel {
  String name;
  String login;
  String avatarUrl;
  String bio;
  String location;
  String email;
  String url;

  GithubUserModel({this.login});

  GithubUserModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['name'];
    avatarUrl = json['avatarUrl'];
    bio = json['bio'];
    location = json['location'];
    email = json['email'];
    url = json['url'];
  }

  @override
  String toString() {
    return "$name ($login) - $email";
  }
}
