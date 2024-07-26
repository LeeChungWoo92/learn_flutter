import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/domain/repository/recipe_repository.dart';

class GetRecipeUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipeUseCase(this._recipeRepository);

  Future<Result<List<Recipe>>> execute() async {
    final results = await _recipeRepository.getRecipes();
    switch (results) {
      case Success<List<Recipe>>():
        return Result.success(results.data);
      case Error<List<Recipe>>():
        return const Result.error('에러발생');
    }
  }
}
