import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';
import 'package:learn_flutter/04_recipe/domain/model/recipe.dart';

class RecipeCategoryItemWidget extends StatelessWidget {
  final Recipe recipe;

  const RecipeCategoryItemWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        color: ColorStyles.gray4Color,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.0),
          child: Stack(
            children: [
              Image.network(
                recipe.imageUrl,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 30,
                left: 8,
                child: Text(
                  recipe.foodName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(recipe.grade.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 16,
                right: 16,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${recipe.cookingTime} Mins',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                        width: 30,
                        height: 30,
                        decoration:
                            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const ClipOval(
                            child: Icon(
                          Icons.bookmark_border,
                          color: Colors.green,
                        )))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
