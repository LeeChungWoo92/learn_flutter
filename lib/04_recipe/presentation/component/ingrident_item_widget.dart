import 'package:flutter/material.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';

import '../../../01_widget_rule/data/model/ingrident.dart';

class IngridentItemWidget extends StatelessWidget {
  final Ingrident ingrident;

  const IngridentItemWidget({
    super.key,
    required this.ingrident,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: ColorStyles.gray4Color.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Image.network(
              ingrident.imageUrl,
              width: 40,
              height: 40,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              ingrident.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '${ingrident.weight}g',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
