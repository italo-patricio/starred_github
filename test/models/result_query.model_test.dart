import 'package:flutter_test/flutter_test.dart';
import 'package:starred_github/models/result_query.model.dart';

import '../mocks/mocks_result.dart';

void main() {
  group('Result Query Model Unit Tests', () {
    test(
        'should return Result Query Model not null when data parsing json success result',
        () {
      final resultQueryUser =
          GithubUserModel.fromJson(mockResultSuccess['user']);
      expect(resultQueryUser, equals(isNotNull));
      expect(resultQueryUser.login, equals("italo-patricio"));
    });
  });
}
