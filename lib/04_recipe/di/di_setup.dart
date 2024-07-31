import 'package:get_it/get_it.dart';
import 'package:learn_flutter/04_recipe/data/datasource/ingrident_datasource.dart';
import 'package:learn_flutter/04_recipe/data/datasource/ingrident_datasource_impl.dart';
import 'package:learn_flutter/04_recipe/data/datasource/procedure_datasource.dart';
import 'package:learn_flutter/04_recipe/data/datasource/procedure_datasource_impl.dart';
import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource.dart';
import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource_impl.dart';
import 'package:learn_flutter/04_recipe/data/repository/ingrident_repository_impl.dart';
import 'package:learn_flutter/04_recipe/data/repository/procedure_repository_impl.dart';
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository_impl.dart';
import 'package:learn_flutter/04_recipe/domain/repository/ingrident_repository.dart';
import 'package:learn_flutter/04_recipe/domain/repository/procedure_repository.dart';
import 'package:learn_flutter/04_recipe/domain/repository/recipe_repository.dart';
import 'package:learn_flutter/04_recipe/domain/use_case/get_recipe_use_case.dart';
import 'package:learn_flutter/04_recipe/domain/use_case/search_recipe_use_case.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/search_recipe/search_recipes_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  //싱글턴
  getIt.registerSingleton<RecipeDatasource>(RecipeDatasourceImpl());
  getIt.registerSingleton<RecipeRepository>(RecipeRepositoryImpl(getIt()));

  getIt.registerSingleton<IngridentDatasource>(IngridentDatasourceImpl());
  getIt.registerSingleton<IngridentRepository>(IngridentRepositoryImpl(getIt()));

  getIt.registerSingleton<ProcedureDatasource>(ProcedureDatasourceImpl());
  getIt.registerSingleton<ProcedureRepository>(ProcedureRepositoryImpl(getIt()));

  getIt.registerSingleton(GetRecipeUseCase(getIt()));
  getIt.registerSingleton(SearchRecipeUseCase(getIt()));

  getIt.registerFactory<SavedRecipesViewModel>(() => SavedRecipesViewModel(getIt()));

  getIt.registerFactory<SavedRecipeDetailViewModel>(
      () => SavedRecipeDetailViewModel(getIt(), getIt()));

  getIt.registerFactory<SearchRecipesViewModel>(() => SearchRecipesViewModel(getIt(), getIt()));
}
