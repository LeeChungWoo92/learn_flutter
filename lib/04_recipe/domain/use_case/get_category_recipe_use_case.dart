import 'package:injectable/injectable.dart';
import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';

import 'get_recipe_use_case.dart';

@singleton
class GetCategoryRecipeUseCase {
  final GetRecipeUseCase _getRecipeUseCase;

  GetCategoryRecipeUseCase(this._getRecipeUseCase);

  Future<Result<List<Recipe>>> execute(String category) async {
    final results = await _getRecipeUseCase.execute();
    switch (results) {
      case Success<List<Recipe>>():
        final categoryResults = results.data
            .where((recipe) => recipe.category.toLowerCase().contains(category.toLowerCase()))
            .toList();
        return Result.success(categoryResults);
      case Error<List<Recipe>>():
        return const Result.error('에러발생');
    }
  }
}
