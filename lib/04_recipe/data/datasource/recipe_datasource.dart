import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';

abstract interface class RecipeDatasource {
  Future<List<Recipe>> getRecipes();
}
