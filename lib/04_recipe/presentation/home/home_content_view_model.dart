import 'package:flutter/material.dart';

class HomeContentViewModel with ChangeNotifier {
  final List<String> categories = ['All', 'Indian', 'Italian', 'Asian', 'Chinese'];
  String _selectedCategory = 'All';

  String get selectedCategory => _selectedCategory;

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
