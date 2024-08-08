import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/domain/use_case/get_category_recipe_use_case.dart';
import 'package:learn_flutter/04_recipe/domain/use_case/get_recipe_use_case.dart';
import 'package:learn_flutter/04_recipe/presentation/home/home_content_ui_state.dart';

class HomeContentViewModel with ChangeNotifier {
  final GetRecipeUseCase _getRecipeUseCase;
  final GetCategoryRecipeUseCase _getCategoryRecipeUseCase;

  HomeContentViewModel(this._getRecipeUseCase, this._getCategoryRecipeUseCase) {
    getRecipes();
  }

  HomeContentUiState _state = const HomeContentUiState();

  HomeContentUiState get state => _state;

  void onSelectCategory(String category) {
    _state = state.copyWith(selectedCategory: category);
    getSearchRecipes(category);
    notifyListeners();
  }

  void getRecipes() async {
    final result = await _getRecipeUseCase.execute();
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipe: result.data);
      case Error<List<Recipe>>():
        throw '에러발생';
    }
    notifyListeners();
  }

  void getSearchRecipes(String category) async {
    var result = await _getCategoryRecipeUseCase.execute(category);
    if(category == 'All'){
      result = await _getRecipeUseCase.execute();
    }
    switch (result) {
      case Success<List<Recipe>>():
        _state = state.copyWith(recipe: result.data);
      case Error<List<Recipe>>():
        throw '에러발생';
    }
    notifyListeners();
  }
}
