import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/presentation/component/input_field_search.dart';
import 'package:learn_flutter/04_recipe/presentation/search_recipe/search_recipes_view_model.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/component/recipe_card_widget.dart';

import '../../../03_food_recipe_app/ui/fonts.dart';

class SearchRecipesScreen extends StatelessWidget {
  final SearchRecipesViewModel viewModel;

  const SearchRecipesScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search recipes', style: Fonts.mediumTextBold),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputFieldSearch(
              onSearch: (query) {
                viewModel.getSearchRecipes(query);
              },
            ),
            const SizedBox(height: 20),
            Text('Search Result', style: Fonts.normalTextBold),
            const SizedBox(height: 20),
            Expanded(
              child: recipeList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget recipeList() {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (BuildContext context, Widget? child) {
        final recipes = viewModel.state.recipe;

        if (recipes.isEmpty) {
          return const Center(
            child: Text(
              '검색 결과가 없습니다.',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15.0,
          ),
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            final recipe = recipes[index];
            if (viewModel.state.isLoading) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }

            return RecipeCardWidget(
              recipe: recipe,
              isVisibleDetailUi: false,
            );
          },
        );
      },
    );
  }
}
