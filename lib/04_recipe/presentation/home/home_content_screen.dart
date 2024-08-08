import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter/04_recipe/presentation/component/input_field_search.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/fonts.dart';
import 'package:learn_flutter/04_recipe/presentation/component/recipe_category_item_widget.dart';
import 'package:learn_flutter/04_recipe/presentation/component/recipe_category_picker.dart';
import 'package:learn_flutter/04_recipe/presentation/home/home_content_view_model.dart';
import 'package:provider/provider.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeContentViewModel>();
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 50,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Jega',
              style: Fonts.largeTextBold,
            ),
            const SizedBox(height: 5),
            Text(
              'What are you cooking today?',
              style: Fonts.smallerTextRegular.copyWith(
                color: ColorStyles.gray3Color,
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                context.push('/search_recipes');
              },
              child: AbsorbPointer(
                child: InputFieldSearch(
                  isReadOnly: true,
                  onSearch: (query) {},
                ),
              ),
            ),
            const SizedBox(height: 20),
            RecipeCategoryPicker(
              onTapCategory: (String category) {
                viewModel.onSelectCategory(category);
              },
              categories: viewModel.state.categories,
              selectedCategory: viewModel.state.selectedCategory,
            ),
            const SizedBox(height: 20),
            recipeList(viewModel),
          ],
        ),
      )),
    );
  }

  Widget recipeList(HomeContentViewModel homeContentViewModel) {
    final recipes = homeContentViewModel.state.recipe;
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          if(recipes.isEmpty) {
            return Text('없음');
          }else {
            return SizedBox(
              width: 180,
              child: RecipeCategoryItemWidget(recipe: recipe),
            );
          }

        },
      ),
    );
  }
}
