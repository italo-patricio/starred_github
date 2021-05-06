import 'package:flutter_test/flutter_test.dart';
import 'package:starred_github/models/result_query.model.dart';

import '../mocks/mocks_result.dart';

void main() {
  group('Result Query Model Unit Tests', () {
    test(
        'should return Result Query Model not null when data parsing json success result',
        () {
      final resultQueryUser = ResultQueryUser.fromJson(mockResultSuccess);
      expect(resultQueryUser.data, equals(isNotNull));
      expect(resultQueryUser.data.login, equals("italo-patricio"));
      expect(resultQueryUser.errors, equals(isNull));
    });
    test(
        'should return Result Query Model not null when data parsing json error result',
        () {
      final resultQueryUser = ResultQueryUser.fromJson(mockResultError);
      expect(resultQueryUser.data, equals(isNull));
      expect(resultQueryUser.errors, equals(isNotNull));
      expect(resultQueryUser.errors.first.message, equals(isNotNull));
    });
    test(
        'should return Result Query Model not null when data parsing json null',
        () {
      final resultQueryUser = ResultQueryUser.fromJson(null);
      expect(resultQueryUser, equals(isNotNull));
    });
  });
}
