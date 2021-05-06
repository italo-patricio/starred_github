import 'package:flutter_test/flutter_test.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:starred_github/repositories/github.repository.dart';
import 'package:starred_github/repositories/queries/user_query.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mocks_result.dart';

class MockHasuraConnect extends Mock implements HasuraConnect {}

void main() {
  GithubRepository repository;
  MockHasuraConnect mockConnect;

  setUp(() {
    mockConnect = MockHasuraConnect();
    repository = GithubRepository(mockConnect);
  });

  group('Github Repository Unit Tests', () {
    test(
        'Should return github user model not null when called findUserByLogin searching by user existing',
        () async {
      final loginToSearch = "italo-patricio";

      when(mockConnect.query(getRepoByUserQuery))
          .thenAnswer((_) async => mockResultSuccess);

      final userResult = await repository.findUserByLogin(loginToSearch);

      expect(userResult.data, equals(isNotNull));
      expect(userResult.data.login, equals(loginToSearch));
    });
    test(
        'Should return github user model null when called findUserByLogin searching by user not existing',
        () async {
      final loginToSearch = "italo";

      when(mockConnect.query(getRepoByUserQuery))
          .thenAnswer((_) async => mockResultError);

      final userResult = await repository.findUserByLogin(loginToSearch);

      expect(userResult.errors, equals(isNotNull));
      expect(userResult.errors.first.message, equals(isNotNull));
      expect(userResult.data, equals(isNull));
    });
  });
}
