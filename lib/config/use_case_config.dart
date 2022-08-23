import 'package:zemoga_test/domain/use_cases/comments/get_comments.usecase.dart';
import 'package:zemoga_test/domain/use_cases/posts/get_posts_usecase.dart';
import 'package:zemoga_test/domain/use_cases/user/get_user_usecase.dart';

import '../infrastructure/mockRepository/posts_api/posts_api_mock.dart';
import '../infrastructure/repository/comments_api/comments_api.dart';
import '../infrastructure/repository/posts_api/posts_api.dart';
import '../infrastructure/repository/user_api.dart/user_api.dart';

class UseCaseConfig {
  late GetPostsUseCase getPostsUseCase;
  late GetPostsUseCase getPostMock;
  late GetCommentsUseCase getCommentsUseCase;
  late GetUserUseCase getUserUseCase;
  late PostsApi _postsApi;
  late PostApiMock _postApiMock;
  late UserApi _userAPi;
  late CommentsApi _commentsApi;

  UseCaseConfig() {
    _postsApi = PostsApi();
    _postApiMock = PostApiMock();
    _commentsApi = CommentsApi();
    _userAPi = UserApi();
    getPostsUseCase = GetPostsUseCase(_postsApi);
    getPostMock = GetPostsUseCase(_postApiMock);
    getCommentsUseCase = GetCommentsUseCase(_commentsApi);
    getUserUseCase = GetUserUseCase(_userAPi);
  }
}
