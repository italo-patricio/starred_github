import 'repository.model.dart';

class StarredRepositoryModel {
  int totalCount;
  List<RepositoryModel> repos = [];

  StarredRepositoryModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (hasNodeRepository(json)) {
      (json['nodes'] as List).forEach((element) {
        repos.add(RepositoryModel.fromJson(element));
      });
    }
  }

  bool hasNodeRepository(Map<String, dynamic> json) {
    return json['nodes'] != null;
  }
}
