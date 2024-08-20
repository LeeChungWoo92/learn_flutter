import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../03_food_recipe_app/presentaion/component/big_button.dart';
import '../../../03_food_recipe_app/ui/color_styles.dart';
import '../../../03_food_recipe_app/ui/fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                    const Spacer(),
                    const Text(
                      'Get',
                    style: TextStyle(fontSize: 50,color: Colors.white),
                    ),
                    const Text(
                      'CooKing',
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    BigButton(
                      title: 'Start Cooking',
                      onTap: () {
                        context.push('/sign_up');
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

    );
  }
}
