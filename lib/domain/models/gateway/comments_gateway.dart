import 'package:zemoga_test/domain/models/comments.dart';

abstract class CommentsGateway {
  Future<List<Comment>> getAll(int postId);
}
