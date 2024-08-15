import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipes_view_model.dart';
import 'package:provider/provider.dart';

import '../../di/di_setup.dart';

class SavedRecipeScreenRoot extends StatelessWidget {
  const SavedRecipeScreenRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SavedRecipesViewModel>(
      create: (_) => getIt<SavedRecipesViewModel>(),
      child: Consumer<SavedRecipesViewModel>(
        builder: (context, viewModel, child) {
          return SavedRecipeScreen(state: viewModel.state);
        },
      ),
    );
  }
}
