import 'package:zemoga_test/domain/models/posts.dart';

abstract class PostGateway {
  Future<List<Posts>> getAll();
}
