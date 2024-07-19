import 'package:learn_flutter/04_recipe/core/result.dart';
import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource.dart';
import 'package:learn_flutter/04_recipe/data/model/recipe.dart';
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  RecipeDatasource recipeDatasource;

  RecipeRepositoryImpl(this.recipeDatasource);

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      final data = await recipeDatasource.getRecipes();
      return Result.success(data);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  @override
  Future<Result<List<Recipe>>> getSearchRecipes(String foodName) async {
    final data = await getRecipes();
    if (data is Success<List<Recipe>>) {
      final recipes = data.data;
      final searchResults = recipes
          .where((recipe) =>
              recipe.foodName.toLowerCase().contains(foodName.toLowerCase()))
          .toList();
      return Result.success(searchResults);
    } else if (data is Error<List<Recipe>>) {
      return Result.error(data.e);
    } else {
      return const Result.error('Unknown error');
    }
  }
}
