import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';
import 'package:learn_flutter/04_recipe/domain/model/procedure.dart';

part 'saved_recipe_detail_ui_state.freezed.dart';
part 'saved_recipe_detail_ui_state.g.dart';

@freezed
class SavedRecipeDetailUiState with _$SavedRecipeDetailUiState {
  const factory SavedRecipeDetailUiState({
    @Default([]) List<Ingrident> ingrident,
    @Default([]) List<Procedure> procedure,
    @Default(false) bool isLoading,
    @Default('에러발생') String errorMessage,
  }) = _SavedRecipeDetailUiState;

  factory SavedRecipeDetailUiState.fromJson(Map<String, Object?> json) => _$SavedRecipeDetailUiStateFromJson(json);
}