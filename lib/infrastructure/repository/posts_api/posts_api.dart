import 'dart:convert';

import 'package:zemoga_test/config/api_constants.dart';
import 'package:zemoga_test/domain/models/gateway/posts_gateway.dart';
import 'package:zemoga_test/domain/models/posts.dart';
import "package:http/http.dart" as http;
import 'package:zemoga_test/infrastructure/helpers/maps/mappers/posts_mapper.dart';

class PostsApi extends PostGateway {
  final PostMapper _postMapper = PostMapper();
  List<Posts> postsFromJson2(String str) =>
      List<Posts>.from(json.decode(str).map((x) => _postMapper.fromMap(x)));
  @override
  Future<List<Posts>> getAll() async {
    final response = await http
        .get(Uri.parse(Apiconstants.baseUrl + Apiconstants.postsEndpoint));

    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      return postsFromJson2(jsonString);
    } else {
      throw Exception('URL unavailable');
    }
  }
}
