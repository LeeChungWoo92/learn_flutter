import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_flutter/04_recipe/data/model/recipe.dart';

part 'saved_recipes_ui_state.freezed.dart';

part 'saved_recipes_ui_state.g.dart';

@freezed
class SavedRecipesUiState with _$SavedRecipesUiState {
  const factory SavedRecipesUiState({
    @Default([]) List<Recipe> recipe,
    @Default(false) bool isLoading,
    @Default('에러발생') String errorMessage,

  }) = _SavedRecipesUiState;

  factory SavedRecipesUiState.fromJson(Map<String, Object?> json) => _$SavedRecipesUiStateFromJson(json);
}