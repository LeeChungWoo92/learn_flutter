import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/component/recipe_card_widget.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/component/saved_recipes_view_model.dart';

import '../../../03_food_recipe_app/ui/fonts.dart';

class SavedRecipeScreen extends StatelessWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipeScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved recipes',
          style: Fonts.mediumTextBold,
        ),
        centerTitle: true,
      ),
      body: recipeList(),
    );
  }

  Widget recipeList() {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        final recipes = viewModel.recipes;

        return ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            if (viewModel.isLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            return GestureDetector(
                onTap: () {
                  context.push('/recipe_detail', extra: recipe);
                },
                child: Hero(
                    tag: recipe.imageUrl,
                    child: RecipeCardWidget(recipe: recipe)));
          },
        );
      },
    );
  }

//-----기존 코드 (리팩토링 전)
// body: FutureBuilder<Result<List<Recipe>>>(
//   future: recipeRepository.getRecipes(),
//   builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(child: CircularProgressIndicator());
//     } else if (snapshot.hasError) {
//       return Center(child: Text('Error: ${snapshot.error}'));
//     } else if (snapshot.hasData) {
//       final result = snapshot.data!;
//
//       switch (result) {
//         case Success<List<Recipe>>():
//           return ListView.builder(
//             itemCount: result.data.length,
//             itemBuilder: (context, index) {
//               final recipe = result.data[index];
//               return GestureDetector(
//                   onTap: () {
//                     context.push('/recipe_detail', extra: recipe);
//                   },
//                   child: Hero(tag: recipe.imageUrl,
//                   child: RecipeCardWidget(recipe: recipe)));
//             },
//           );
//
//         case Error<List<Recipe>>():
//           return const Center(child: Text(''));
//       }
//     } else {
//       return const Center(child: Text('No data available'));
//     }
//   },
// ),
}
