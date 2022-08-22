import 'dart:convert';

import 'package:flutter/Material.dart';

import '../config/use_case_config.dart';
import '../config/utils/shared_preferences_util.dart';
import '../domain/models/posts.dart';

class PostsViewModel extends ChangeNotifier {
  final UseCaseConfig _postsConfig = UseCaseConfig();

  final List<Posts> _postsList = [];
  final List _favoritesList = [];
  bool _isLoading = false;
  bool _activeConnection = false;

  //bool _isFavorite = false;

  List<Posts> get postsList => _postsList;
  get isLoading => _isLoading;
  get favoritesList => _favoritesList;
  get activeConnection => _activeConnection;

  setLoading(bool loadingState) {
    _isLoading = loadingState;
  }

  setActiveConnection(bool active) {
    _activeConnection = active;
  }

  setPostList(List<Posts> list) {
    _postsList.addAll(list);
  }

  clearPosts() {
    _postsList.removeWhere((element) => element.favorite == false);
    notifyListeners();
  }

  deletePost(int id) {
    _postsList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  sortPosts() {
    _postsList.sort((a, b) {
      if (b.favorite!) {
        return 1;
      }
      return -1;
    });
  }

  changeFavoriteStatus(int index, bool isFavorite) {
    _postsList[index].favorite = isFavorite;
    notifyListeners();
  }

  PostsViewModel() {
    getPosts();
  }

  void getPosts() async {
    setLoading(true);
    notifyListeners();
    try {
      var response = await _postsConfig.getPostsUseCase.getAll();
      setActiveConnection(true);
      setPostList(response);
      //await SharedPrefs.setPosts('Posts', response as List<String>);
      setLoading(false);
      notifyListeners();
    } catch (e) {
      debugPrint('No internet' + e.toString());
      notifyListeners();
    }
  }
}
