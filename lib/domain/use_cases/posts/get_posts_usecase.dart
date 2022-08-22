import 'package:zemoga_test/domain/models/gateway/posts_gateway.dart';
import 'package:zemoga_test/domain/models/posts.dart';

class GetPostsUseCase {
  final PostGateway _postGateway;
  GetPostsUseCase(this._postGateway);

  Future<List<Posts>> getAll() async {
    return _postGateway.getAll();
  }
}
