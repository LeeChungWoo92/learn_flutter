import 'package:flutter/material.dart';

class RecipeCategoryPicker extends StatelessWidget {
  final void Function(String category) onTapCategory;

  final List<String> categories;
  final String selectedCategory;

  const RecipeCategoryPicker({
    super.key,
    required this.onTapCategory,
    required this.categories,
    required this.selectedCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category;
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
              onTapCategory(category);
            },
          );
        },
      ),
    );
  }
}
