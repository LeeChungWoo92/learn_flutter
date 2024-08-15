import 'package:injectable/injectable.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/domain/use_case/get_recipe_use_case.dart';

@singleton
class SearchRecipeUseCase {
  final GetRecipeUseCase _getRecipeUseCase;

  SearchRecipeUseCase(this._getRecipeUseCase);

  Future<Result<List<Recipe>>> execute(String foodName) async {
    final results = await _getRecipeUseCase.execute();
    switch (results) {
      case Success<List<Recipe>>():
        final searchResults = results.data
            .where((recipe) =>
                recipe.foodName.toLowerCase().contains(foodName.toLowerCase()))
            .toList();
        return Result.success(searchResults);
      case Error<List<Recipe>>():
        return const Result.error('에러발생');
    }
  }
}
