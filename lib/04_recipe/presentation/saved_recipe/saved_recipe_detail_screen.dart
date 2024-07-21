import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/data/model/recipe.dart';
import 'package:learn_flutter/04_recipe/presentation/component/profile_widget.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/component/recipe_card_widget.dart';

import '../../../01_widget_rule/data/model/profile.dart';

class SavedRecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;

  const SavedRecipeDetailScreen({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final _profile = const Profile(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/06/25/16/25/micky-mouse-5340128_1280.jpg',
      name: '미키마우스',
      locationName: 'Lagos,Nigeria',
    );

    bool _isFollow = false;

    void _toggleFollow(String message) {
      _isFollow = !_isFollow;
      print(message);
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                  tag: recipe.imageUrl,
                  child: RecipeCardWidget(recipe: recipe)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    recipe.foodName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Material(
                    child: Text(
                      '(13k Reviews)',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ProfileWidget(
                  profile: _profile,
                  onFollowTap: _toggleFollow,
                  isFollow: _isFollow)
            ],
          ),
        ),
      ),
    );
  }
}
