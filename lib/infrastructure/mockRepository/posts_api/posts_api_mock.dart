import 'dart:convert';
import 'package:mocktail/mocktail.dart';
import 'package:zemoga_test/domain/models/gateway/posts_gateway.dart';
import 'package:zemoga_test/domain/models/posts.dart';
import 'package:zemoga_test/infrastructure/mockRepository/posts_response_mock.dart';
import '../../helpers/maps/mappers/posts_mapper.dart';

class PostApiMock extends Mock implements PostGateway {
  // final PostMapper _postMapper = PostMapper();
  // List<Posts> postsFromJson2(String str) =>
  //     List<Posts>.from(json.decode(str).map((x) => _postMapper.fromMap(x)));

  @override
  Future<List<Posts>> getAll() async {
    var response = postsResponse;
    return response;
  }
}
