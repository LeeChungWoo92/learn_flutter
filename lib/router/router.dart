import 'package:go_router/go_router.dart';
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/component/saved_recipes_view_model.dart';

import '../04_recipe/data/datasource/recipe_datasource_impl.dart';
import '../04_recipe/data/model/recipe.dart';
import '../04_recipe/data/repository/recipe_repository_impl.dart';
import '../04_recipe/presentation/home/home_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_detail_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_screen.dart';

final _dataource = RecipeDatasourceImpl();
final _repository = RecipeRepositoryImpl(_dataource);

final router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final viewModel = SavedRecipesViewModel(_repository);
        return HomeScreen(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: '/saved_recipe',
      builder: (context, state) {
        final viewModel = SavedRecipesViewModel(_repository);
        return SavedRecipeScreen(viewModel: viewModel);
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
