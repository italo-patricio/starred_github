import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:starred_github/models/result_query.model.dart';
import 'package:starred_github/repositories/github.repository.dart';
import 'package:starred_github/repositories/queries/user_query.dart';
import 'package:mockito/mockito.dart';
import 'package:gql/language.dart';

import '../mocks/mocks_result.dart';

class MockLink extends Mock implements Link {}

void main() {
  GithubRepository repository;
  MockLink link;
  GraphQLClient mockConnect;

  setUp(() {
    link = MockLink();

    mockConnect = GraphQLClient(
      cache: getTestCache(),
      link: link,
    );

    repository = GithubRepository(mockConnect);
  });

  group('Github Repository Unit Tests', () {
    test(
        'Should return github user model not null when called findUserByLogin searching by user existing',
        () async {
      final loginToSearch = "italo-patricio";

      final queryOptions = QueryOptions(
          document: gql(getUserByLoginQuery),
          variables: {'login': '$loginToSearch'});

      final queryResults = QueryResult(
        data: mockResultSuccess,
        exception: null,
        source: QueryResultSource.network,
      );

      when(link.request(any)).thenAnswer(
          (_) => Stream.fromIterable([Response(data: mockResultSuccess)]));

      final userResult = await repository.findUserByLogin(loginToSearch);

      expect(userResult.data, equals(isNotNull));
      expect(userResult.data['user']['login'], equals(loginToSearch));
    });

    test(
        'Should return github user model null when called findUserByLogin searching by user not existing',
        () async {
      final loginToSearch = "italo";

      final queryOptions = QueryOptions(
          document: gql(getUserByLoginQuery),
          variables: {'login': loginToSearch});

      when(link.request(any)).thenAnswer(
          (_) => Stream.fromIterable([Response(data: mockResultError)]));

      final userResult = await repository.findUserByLogin(loginToSearch);

      expect(userResult.data['errors'], equals(isNotNull));
      expect(userResult.data['errors'][0]['message'], equals(isNotNull));
      expect(userResult.data['data']['user'], equals(isNull));
    });
  });
}

class TestCache extends GraphQLCache {
  get partialDataPolicy => PartialDataCachePolicy.reject;
}

GraphQLCache getTestCache() => TestCache();
