import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/domain/use_case/get_recipe_use_case.dart';
import 'package:learn_flutter/04_recipe/domain/use_case/search_recipe_use_case.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_ui_state.dart';

class SearchRecipesViewModel with ChangeNotifier {
  final GetRecipeUseCase _getRecipeUseCase;
  final SearchRecipeUseCase _searchRecipeUseCase;

  SearchRecipesViewModel(
    this._getRecipeUseCase,
    this._searchRecipeUseCase,
  ) {
    getRecipes();
  }

  SavedRecipesUiState _state = const SavedRecipesUiState();

  SavedRecipesUiState get state => _state;

  void getRecipes() async {
    _state = state.copyWith(isLoading: true);
    final result = await _getRecipeUseCase.execute();
    _state = state.copyWith(isLoading: false);
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipe: result.data);
      case Error<List<Recipe>>():
        _state = state.copyWith(errorMessage: '에러발생');
    }
    notifyListeners();
  }

  void getSearchRecipes(String foodName) async {
    _state = state.copyWith(isLoading: true);
    final result = await _searchRecipeUseCase.execute(foodName);
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
