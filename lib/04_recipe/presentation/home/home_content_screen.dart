import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter/04_recipe/presentation/component/input_field_search.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/fonts.dart';
import 'package:learn_flutter/04_recipe/presentation/component/recipe_category_picker.dart';

class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            const RecipeCategoryPicker(),
          ],
        ),
      )),
    );
  }
}
