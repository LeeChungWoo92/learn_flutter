import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';

import '../../domain/repository/recipe_repository.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesViewModel(this._recipeRepository) {
    getRecipes();
  }

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void getRecipes() async {
    _isLoading = true;
    final data = await _recipeRepository.getRecipes();
    _isLoading = false;
    switch (data) {
      case Success<List<Recipe>>():
        _recipes = data.data;
      case Error<List<Recipe>>():
        _errorMessage = '에러발생';
    }

    notifyListeners();
  }

  void getSearchRecipes(String foodName) async {
    _isLoading = true;
    final data = await _recipeRepository.getSearchRecipes(foodName);
    _isLoading = false;
    switch (data) {
      case Success<List<Recipe>>():
        _recipes = data.data;
      case Error<List<Recipe>>():
        _errorMessage = '에러발생';
    }

    notifyListeners();
  }
}
