import 'dart:convert';

import 'package:zemoga_test/config/api_constants.dart';
import 'package:zemoga_test/domain/models/comments.dart';

import "package:http/http.dart" as http;

import '../../../../domain/models/gateway/comments_gateway.dart';
import '../../helpers/maps/mappers/comments_mapper.dart';

class CommentsApi extends CommentsGateway {
  final CommentMapper _commentMapper = CommentMapper();
  List<Comment> commentsFromJson(String str) => List<Comment>.from(
      json.decode(str).map((x) => _commentMapper.fromMap(x)));
  @override
  Future<List<Comment>> getAll(int postId) async {
    final response = await http.get(Uri.parse(Apiconstants.baseUrl +
        Apiconstants.commentsEndpoint +
        postId.toString()));

    if (response.statusCode == 200) {
      var jsonString = utf8.decode(response.bodyBytes);
      return commentsFromJson(jsonString);
    } else {
      throw Exception('No fue posible conectarse a la URL');
    }
  }
}
