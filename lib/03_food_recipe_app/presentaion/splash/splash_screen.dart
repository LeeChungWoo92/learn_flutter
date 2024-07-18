import 'package:flutter/material.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';

import '../../ui/fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_splash.png'),
              // Replace with your image
              fit: BoxFit.cover,
            ),
          ),
        ),
        SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset('assets/logo_splash.png'),
                const SizedBox(height: 14),
                Text(
                  '100K+ Premium Recipe',
                  style: Fonts.mediumTextBold.copyWith(
                    color: ColorStyles.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
