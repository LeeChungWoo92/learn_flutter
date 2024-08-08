import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';

part 'home_content_ui_state.freezed.dart';

part 'home_content_ui_state.g.dart';

@freezed
class HomeContentUiState with _$HomeContentUiState {
  const factory HomeContentUiState({
    @Default(['All', 'Indian', 'Italian', 'Asian', 'Chinese']) List<String> categories,
    @Default('All') String selectedCategory,
    @Default([]) List<Recipe> recipe,
  }) = _HomeContentUiState;

  factory HomeContentUiState.fromJson(Map<String, Object?> json) => _$HomeContentUiStateFromJson(json);
}
