import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:zemoga_test/config/use_case_config.dart';
import 'package:zemoga_test/domain/models/gateway/posts_gateway.dart';
import 'package:zemoga_test/infrastructure/mockRepository/posts_api/posts_api_mock.dart';
import 'package:zemoga_test/infrastructure/mockRepository/posts_response_mock.dart';

class MockPostAPi extends Mock implements PostGateway {}

void main() {
  late UseCaseConfig postsConfig;
  late MockPostAPi mockPostAPi;
  setUp(() {
    postsConfig = UseCaseConfig();
    mockPostAPi = MockPostAPi();
  });

  group('Tests for api response', () {
    test('Test for succesful connection', () async {
      when(() => mockPostAPi.getAll())
          .thenAnswer((_) => Future.value(postsResponse));

      final result = await postsConfig.getPostMock.getAll();

      expect(result, equals(postsResponse));
    });
  });
}
