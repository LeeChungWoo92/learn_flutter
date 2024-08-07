import 'package:flutter/material.dart';

class RecipeCategoryPicker extends StatefulWidget {
  const RecipeCategoryPicker({
    super.key,
  });

  @override
  State<RecipeCategoryPicker> createState() => _RecipeCategoryPickerState();
}

class _RecipeCategoryPickerState extends State<RecipeCategoryPicker> {
  final List<String> _categories = ['All', 'Indian', 'Italian', 'Asian', 'Chinese'];
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedCategory == category;
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
              setState(() {
                _selectedCategory = category;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(_selectedCategory),
                    duration: const Duration(seconds: 1),
                  ),
                );
              });
            },
          );
        },
      ),
    );
  }
}
