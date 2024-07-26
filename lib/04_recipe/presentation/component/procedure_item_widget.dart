import 'package:flutter/material.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/fonts.dart';
import 'package:learn_flutter/04_recipe/domain/model/procedure.dart';

class ProcedureItemWidget extends StatelessWidget {
  final Procedure procedure;

  const ProcedureItemWidget({
    super.key,
    required this.procedure,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: ColorStyles.gray4Color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              procedure.title,
              style: Fonts.smallerTextBold,
            ),
            const SizedBox(height: 5),
            Text(
              procedure.content,
              style: Fonts.smallerTextRegular
                  .copyWith(color: ColorStyles.gray3Color),
            ),
          ],
        ),
      ),
    );
  }
}
