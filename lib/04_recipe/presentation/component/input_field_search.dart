import 'package:flutter/material.dart';

import '../../../03_food_recipe_app/ui/color_styles.dart';
import '../../../03_food_recipe_app/ui/fonts.dart';

class InputFieldSearch extends StatelessWidget {
  final bool isReadOnly;
  final Function(String) onSearch;

  const InputFieldSearch({
    super.key,
    this.isReadOnly = false,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final contentEditController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorStyles.gray4Color),
                ),
                child: TextField(
                  controller: contentEditController,
                  readOnly: isReadOnly,
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/search_normal.png'),
                    prefixIconColor: ColorStyles.gray4Color,
                    hintText: 'Search recipe',
                    hintStyle: Fonts.smallerTextRegular.copyWith(
                      color: ColorStyles.gray4Color,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                onSearch(contentEditController.text);
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorStyles.primary100Color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/setting.png',
                  width: 20,
                  height: 20,
                  color: ColorStyles.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
