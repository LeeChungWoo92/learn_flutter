import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/data/model/recipe.dart';
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel(this._recipeRepository) {
    getRecipes();
  }

  List<Recipe> _recipes = [];

  List<Recipe> get recipes => List.unmodifiable(_recipes);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void getRecipes() async {
    print('get레시피');
    _isLoading = true;
    final data = await _recipeRepository.getRecipes();
    _isLoading = false;
    switch (data) {
      case Success<List<Recipe>>():
        _recipes = data.data;
        print('레시피');
        print(_recipes);
      case Error<List<Recipe>>():
        print('에러발생');
        _errorMessage = '에러발생';
    }

    notifyListeners();
  }
}
