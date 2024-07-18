import 'package:go_router/go_router.dart';
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository.dart';

import '../04_recipe/data/datasource/recipe_datasource_impl.dart';
import '../04_recipe/data/model/recipe.dart';
import '../04_recipe/data/repository/recipe_repository_impl.dart';
import '../04_recipe/presentation/home/home_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_detail_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_screen.dart';

final recipeDatasourceImpl = RecipeDatasourceImpl();
final recipeRepositoryImpl = RecipeRepositoryImpl(recipeDatasourceImpl);

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return HomeScreen(recipeRepository: recipeRepositoryImpl);
      },
    ),
    GoRoute(
      path: '/saved_recipe',
      builder: (context, state) {
        return SavedRecipeScreen(recipeRepository: recipeRepositoryImpl);
      },
    ),
    GoRoute(
      path: '/recipe_detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return SavedRecipeDetailScreen(recipe: recipe);
      },
    ),
  ],
);
