import 'package:flutter/material.dart';

import '../../domain/models/posts.dart';

class FavoritesViewModel extends ChangeNotifier {
  final List<Posts> _favoritesList = [];
  bool _isLoading = false;
  //bool _isFavorite = false;

  get isLoading => _isLoading;
  List<Posts> get favoritesList => _favoritesList;

  setLoading(bool loadingState) {
    _isLoading = loadingState;
  }

  setFavoritesPost(Posts post) {
    _favoritesList.add(post);
    notifyListeners();
  }

  removeFromFavorites(int id) {
    _favoritesList.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  refreshPage() {
    notifyListeners();
  }
}
