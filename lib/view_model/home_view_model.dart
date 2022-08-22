import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
  String _currentPage = '';

  get currentIndex => _currentIndex;
  get currentPage => _currentPage;

  setCurrentPage(String name) {
    _currentPage = name;
    notifyListeners();
  }

  setcurrenIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
