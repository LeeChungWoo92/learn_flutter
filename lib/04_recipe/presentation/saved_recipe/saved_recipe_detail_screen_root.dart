import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/di/di_setup.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_detail_view_model.dart';
import 'package:provider/provider.dart';

class SavedRecipeDetailScreenRoot extends StatelessWidget {
  final Recipe recipe;

  const SavedRecipeDetailScreenRoot({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SavedRecipeDetailViewModel>(
      create: (_) => getIt<SavedRecipeDetailViewModel>(),
      child: Consumer<SavedRecipeDetailViewModel>(
        builder: (context, viewModel, child) {
          return SavedRecipeDetailScreen(
            recipe: recipe,
            viewModel: viewModel,
          );
        },
      ),
    );
  }
}
