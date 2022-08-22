import 'package:zemoga_test/domain/use_cases/comments/get_comments.usecase.dart';
import 'package:zemoga_test/domain/use_cases/posts/get_posts_usecase.dart';
import 'package:zemoga_test/domain/use_cases/user/get_user_usecase.dart';
import 'package:zemoga_test/infrastructure/adapters/posts_api/posts_api.dart';

import '../infrastructure/adapters/comments_api/comments_api.dart';
import '../infrastructure/adapters/user_api.dart/user_api.dart';

class UseCaseConfig {
  late GetPostsUseCase getPostsUseCase;
  late GetCommentsUseCase getCommentsUseCase;
  late GetUserUseCase getUserUseCase;
  late PostsApi _postsApi;
  late UserApi _userAPi;
  late CommentsApi _commentsApi;

  UseCaseConfig() {
    _postsApi = PostsApi();
    _commentsApi = CommentsApi();
    _userAPi = UserApi();
    getPostsUseCase = GetPostsUseCase(_postsApi);
    getCommentsUseCase = GetCommentsUseCase(_commentsApi);
    getUserUseCase = GetUserUseCase(_userAPi);
  }
}
