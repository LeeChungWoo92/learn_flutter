// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:learn_flutter/04_recipe/data/datasource/ingrident_datasource.dart'
    as _i106;
import 'package:learn_flutter/04_recipe/data/datasource/ingrident_datasource_impl.dart'
    as _i419;
import 'package:learn_flutter/04_recipe/data/datasource/procedure_datasource.dart'
    as _i644;
import 'package:learn_flutter/04_recipe/data/datasource/procedure_datasource_impl.dart'
    as _i283;
import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource.dart'
    as _i500;
import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource_impl.dart'
    as _i602;
import 'package:learn_flutter/04_recipe/data/repository/ingrident_repository_impl.dart'
    as _i608;
import 'package:learn_flutter/04_recipe/data/repository/procedure_repository_impl.dart'
    as _i413;
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository_impl.dart'
    as _i454;
import 'package:learn_flutter/04_recipe/domain/repository/ingrident_repository.dart'
    as _i232;
import 'package:learn_flutter/04_recipe/domain/repository/procedure_repository.dart'
    as _i115;
import 'package:learn_flutter/04_recipe/domain/repository/recipe_repository.dart'
    as _i857;
import 'package:learn_flutter/04_recipe/domain/use_case/copy_link_use_case.dart'
    as _i619;
import 'package:learn_flutter/04_recipe/domain/use_case/get_category_recipe_use_case.dart'
    as _i901;
import 'package:learn_flutter/04_recipe/domain/use_case/get_recipe_use_case.dart'
    as _i455;
import 'package:learn_flutter/04_recipe/domain/use_case/search_recipe_use_case.dart'
    as _i952;
import 'package:learn_flutter/04_recipe/presentation/home/home_content_view_model.dart'
    as _i874;
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_view_model.dart'
    as _i554;
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_view_model.dart'
    as _i777;
import 'package:learn_flutter/04_recipe/presentation/search_recipe/search_recipes_view_model.dart'
    as _i524;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i619.CopyLinkUseCase>(() => _i619.CopyLinkUseCase());
    gh.singleton<_i644.ProcedureDatasource>(
        () => _i283.ProcedureDatasourceImpl());
    gh.singleton<_i106.IngridentDatasource>(
        () => _i419.IngridentDatasourceImpl());
    gh.singleton<_i500.RecipeDatasource>(() => _i602.RecipeDatasourceImpl());
    gh.singleton<_i857.RecipeRepository>(
        () => _i454.RecipeRepositoryImpl(gh<_i500.RecipeDatasource>()));
    gh.singleton<_i232.IngridentRepository>(
        () => _i608.IngridentRepositoryImpl(gh<_i106.IngridentDatasource>()));
    gh.singleton<_i115.ProcedureRepository>(
        () => _i413.ProcedureRepositoryImpl(gh<_i644.ProcedureDatasource>()));
    gh.singleton<_i455.GetRecipeUseCase>(
        () => _i455.GetRecipeUseCase(gh<_i857.RecipeRepository>()));
    gh.factory<_i777.SavedRecipesViewModel>(
        () => _i777.SavedRecipesViewModel(gh<_i455.GetRecipeUseCase>()));
    gh.singleton<_i952.SearchRecipeUseCase>(
        () => _i952.SearchRecipeUseCase(gh<_i455.GetRecipeUseCase>()));
    gh.singleton<_i901.GetCategoryRecipeUseCase>(
        () => _i901.GetCategoryRecipeUseCase(gh<_i455.GetRecipeUseCase>()));
    gh.factory<_i524.SearchRecipesViewModel>(() => _i524.SearchRecipesViewModel(
          gh<_i455.GetRecipeUseCase>(),
          gh<_i952.SearchRecipeUseCase>(),
        ));
    gh.factory<_i874.HomeContentViewModel>(() => _i874.HomeContentViewModel(
          gh<_i455.GetRecipeUseCase>(),
          gh<_i901.GetCategoryRecipeUseCase>(),
        ));
    gh.factory<_i554.SavedRecipeDetailViewModel>(
        () => _i554.SavedRecipeDetailViewModel(
              gh<_i232.IngridentRepository>(),
              gh<_i115.ProcedureRepository>(),
              gh<_i619.CopyLinkUseCase>(),
            ));
    return this;
  }
}
