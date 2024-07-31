import 'package:go_router/go_router.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/sign_up/sign_up_screen.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/splash/splash_screen.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/search_recipe/search_recipes_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:provider/provider.dart';

import '../04_recipe/di/di_setup.dart';
import '../04_recipe/presentation/home/home_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_detail_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_screen.dart';

final router = GoRouter(
  initialLocation: '/sign_up',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return ChangeNotifierProvider<SavedRecipesViewModel>(
          create: (_) => getIt<SavedRecipesViewModel>(),
          child: const HomeScreen(),
        );
      },
    ),
    // Get it 사용 전 코드
    // GoRoute(
    //   path: '/saved_recipe',
    //   builder: (context, state) {
    //     final viewModel = SavedRecipesViewModel(_getRecipeUseCase);
    //     return ChangeNotifierProvider<SavedRecipesViewModel>(
    //       create: (context) => viewModel,
    //       child: const SavedRecipeScreen(),
    //     );
    //   },
    // ),

    GoRoute(
      path: '/saved_recipe',
      builder: (context, state) {
        return ChangeNotifierProvider<SavedRecipesViewModel>(
          create: (_) => getIt<SavedRecipesViewModel>(),
          child: const SavedRecipeScreen(),
        );
      },
    ),
    // Get it 사용 전 코드
    // GoRoute(
    //   path: '/recipe_detail',
    //   builder: (context, state) {
    //     final recipe = state.extra as Recipe;
    //     final viewModel = SavedRecipeDetailViewModel(
    //       _ingridentRepository,
    //       _procedureRepository,
    //     );
    //     return ChangeNotifierProvider<SavedRecipeDetailViewModel>(
    //       create: (context) => viewModel,
    //       child: SavedRecipeDetailScreen(recipe: recipe),
    //     );
    //   },
    // ),
    GoRoute(
      path: '/recipe_detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return ChangeNotifierProvider<SavedRecipeDetailViewModel>(
          create: (_) => getIt<SavedRecipeDetailViewModel>(),
          child: SavedRecipeDetailScreen(recipe: recipe),
        );
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
