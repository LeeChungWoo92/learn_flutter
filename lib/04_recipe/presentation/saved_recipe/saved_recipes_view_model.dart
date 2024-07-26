import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/domain/repository/recipe_repository.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_ui_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel(this._recipeRepository) {
    getRecipes();
  }

  SavedRecipesUiState _state = const SavedRecipesUiState();

  SavedRecipesUiState get state => _state;

  void getRecipes() async {
    _state = state.copyWith(isLoading: true);
    final result = await _recipeRepository.getRecipes();
    _state = state.copyWith(isLoading: false);
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipe: result.data);
      case Error<List<Recipe>>():
        _state = state.copyWith(errorMessage: '에러발생');
    }

    notifyListeners();
  }
}
