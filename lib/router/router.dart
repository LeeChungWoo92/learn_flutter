import 'package:go_router/go_router.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/sign_up/sign_up_screen.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/splash/splash_screen.dart';
import 'package:learn_flutter/04_recipe/data/datasource/ingrident_datasource_impl.dart';
import 'package:learn_flutter/04_recipe/data/datasource/procedure_datasource_impl.dart';
import 'package:learn_flutter/04_recipe/data/repository/ingrident_repository_impl.dart';
import 'package:learn_flutter/04_recipe/data/repository/procedure_repository_impl.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/home/search_recipes_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/home/search_recipes_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:provider/provider.dart';

import '../04_recipe/data/datasource/recipe_datasource_impl.dart';
import '../04_recipe/data/repository/recipe_repository_impl.dart';
import '../04_recipe/presentation/home/home_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_detail_screen.dart';
import '../04_recipe/presentation/saved_recipe/saved_recipe_screen.dart';

final _dataource = RecipeDatasourceImpl();
final _repository = RecipeRepositoryImpl(_dataource);

final _ingridentDatasource = IngridentDatasourceImpl();
final _ingridentRepository = IngridentRepositoryImpl(_ingridentDatasource);

final _procedureDatasource = ProcedureDatasourceImpl();
final _procedureRepository = ProcedureRepositoryImpl(_procedureDatasource);

final router = GoRouter(
  initialLocation: '/sign_up',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        final viewModel = SavedRecipesViewModel(_repository);
        return ChangeNotifierProvider<SavedRecipesViewModel>(
          create: (context) =>viewModel,
          child: const HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/saved_recipe',
      builder: (context, state) {
        final viewModel = SavedRecipesViewModel(_repository);
        return ChangeNotifierProvider<SavedRecipesViewModel>(
          create: (context) => viewModel,
          child: const SavedRecipeScreen(),
        );
      },
    ),
    GoRoute(
      path: '/recipe_detail',
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        final viewModel = SavedRecipeDetailViewModel(
          _ingridentRepository,
          _procedureRepository,
        );
        return ChangeNotifierProvider<SavedRecipeDetailViewModel>(
          create: (context) =>viewModel,
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
        final viewModel = SearchRecipesViewModel(_repository);
        return SearchRecipesScreen(viewModel: viewModel);
      },
    ),
  ],
);
