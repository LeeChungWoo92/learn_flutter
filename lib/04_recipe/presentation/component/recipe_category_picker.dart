import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/presentation/home/home_content_view_model.dart';
import 'package:provider/provider.dart';

class RecipeCategoryPicker extends StatelessWidget {
  const RecipeCategoryPicker({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeContentViewModel>();

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: viewModel.categories.length,
        itemBuilder: (context, index) {
          final category = viewModel.categories[index];
          final isSelected = viewModel.selectedCategory == category;
          return ChoiceChip(
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            label: Text(
              category,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.teal,
                fontSize: 14,
              ),
            ),
            selected: isSelected,
            selectedColor: Colors.teal,
            showCheckmark: false,
            side: BorderSide.none,
            onSelected: (bool selected) {
              viewModel.selectCategory(category);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(viewModel.selectedCategory),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
