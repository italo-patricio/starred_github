class RepositoryModel {
  String name;
  String description;
  int stargazerCount;

  RepositoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    stargazerCount = json['stargazerCount'];
  }
}
