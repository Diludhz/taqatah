import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final List<int> _favoriteIndexes = [];

  List<int> get favoriteIndexes => _favoriteIndexes;

  void toggleFavorite(int index) {
    if (_favoriteIndexes.contains(index)) {
      _favoriteIndexes.remove(index);
    } else {
      _favoriteIndexes.add(index);
    }
    notifyListeners();
  }

  bool isFavorite(int index) {
    return _favoriteIndexes.contains(index);
  }
}
