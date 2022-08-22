import '../../models/comments.dart';
import '../../models/gateway/comments_gateway.dart';

class GetCommentsUseCase {
  final CommentsGateway _commentsGateway;
  GetCommentsUseCase(this._commentsGateway);

  Future<List<Comment>> getComments(int postId) async {
    return _commentsGateway.getAll(postId);
  }
}
