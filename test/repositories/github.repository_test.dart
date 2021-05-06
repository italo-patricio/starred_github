import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:starred_github/repositories/github.repository.dart';

void main() {
  GithubRepository repository;

  setUp(() {
    repository = GithubRepository();
  });

  group('Github Repository Unit Tests', () {
    test(
        'Should return github user model not null when called findUserByLogin searching by user existing',
        () async {
      final loginToSearch = "italo-patricio";
      final userResult = await repository.findUserByLogin(loginToSearch);

      expect(userResult.data, equals(isNotNull));
      expect(userResult.data.login, equals(loginToSearch));
    });
    test(
        'Should return github user model null when called findUserByLogin searching by user not existing',
        () async {
      final loginToSearch = "italo";
      final userResult = await repository.findUserByLogin(loginToSearch);

      expect(userResult.errors, equals(isNotNull));
      expect(userResult.errors.first.message, equals(isNotNull));
      expect(userResult.data, equals(isNull));
    });
  });
}
