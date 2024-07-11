import 'package:flutter/material.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/component/big_button.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/component/input_field.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/component/social_media_button.dart';
import 'package:learn_flutter/03_food_recipe_app/ui/color_styles.dart';

import '../../ui/fonts.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: Fonts.headerTextBold,
              ),
              Text(
                'Welcome Back!',
                style: Fonts.largeTextRegular,
              ),
              const SizedBox(height: 57),
              const InputField(
                titleText: 'Email',
                hintText: 'Enter Email',
              ),
              const SizedBox(height: 30),
              const InputField(
                titleText: 'Enter Password',
                hintText: 'Enter Password',
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 20,
                ),
                child: Text(
                  'Forgot Password?',
                  style: Fonts.smallerTextRegular.copyWith(
                    color: ColorStyles.secondary100Color,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              BigButton(
                title: 'Sign In',
                onTap: () {},
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1,
                      width: 50.0,
                      color: ColorStyles.gray4Color,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      'Or Sign in With',
                      style: Fonts.smallerTextSemiBold.copyWith(
                        color: ColorStyles.gray4Color,
                      ),
                    ),
                    const SizedBox(width: 7),
                    Container(
                      height: 1,
                      width: 50.0,
                      color: ColorStyles.gray4Color,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton(
                    imagePath: 'assets/google.png',
                    onTap: () {},
                  ),
                  const SizedBox(width: 25),
                  SocialMediaButton(
                    imagePath: 'assets/facebook.png',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: Fonts.smallerTextSemiBold
                        .copyWith(color: ColorStyles.blackColor),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Sign up',
                    style: Fonts.smallerTextSemiBold
                        .copyWith(color: ColorStyles.secondary100Color),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
