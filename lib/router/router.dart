import 'package:go_router/go_router.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/sign_up/sign_up_screen.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/search_recipe/search_recipes_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:provider/provider.dart';

import '../04_recipe/di/di_setup.dart';
import '../04_recipe/presentation/home/home_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_detail_screen_root.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_screen_root.dart';
import '../04_recipe/presentation/splash/splash_screen.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return ChangeNotifierProvider<SavedRecipesViewModel>(
          create: (context) => getIt<SavedRecipesViewModel>(),
          child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/saved_recipe',
      builder: (context, state) {
        return const SavedRecipeScreenRoot();
      },
    ),
    GoRoute(
      path: '/recipe_detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return SavedRecipeDetailScreenRoot(recipe: recipe);
      },
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/sign_up',
      builder: (context, state) {
        return const SignUpScreen();
      },
    ),
    GoRoute(
      path: '/search_recipes',
      builder: (context, state) {
        return ChangeNotifierProvider<SearchRecipesViewModel>(
          create: (_) => getIt<SearchRecipesViewModel>(),
          child: const SearchRecipesScreen(),
        );
      },
    ),
  ],
);
