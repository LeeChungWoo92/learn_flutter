import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/color_styles.dart';
import '../../ui/fonts.dart';
import '../component/big_button.dart';
import '../component/input_field.dart';
import '../component/social_media_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 30,
              right: 30,
              top: 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an account',
                  style: Fonts.largeTextBold,
                ),
                const SizedBox(height: 5),
                Text(
                  'Let’s help you set up your account,\nit won’t take long.',
                  style: Fonts.smallerTextRegular,
                ),
                const SizedBox(height: 20),
                const InputField(
                  titleText: 'Name',
                  hintText: 'Enter Name',
                ),
                const SizedBox(height: 20),
                const InputField(
                  titleText: 'Email',
                  hintText: 'Enter Email',
                ),
                const SizedBox(height: 20),
                const InputField(
                  titleText: 'Password',
                  hintText: 'Enter Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                const InputField(
                  titleText: 'Confirm Password',
                  hintText: 'Retype Password',
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 20,
                  ),
                  child: Text(
                    'Accept terms & Condition',
                    style: Fonts.smallerTextRegular.copyWith(
                      color: ColorStyles.secondary100Color,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                BigButton(
                  title: 'Sign Up',
                  onTap: () {
                    context.push('/home');
          
                  },
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
                      'Already a member?',
                      style: Fonts.smallerTextSemiBold
                          .copyWith(color: ColorStyles.blackColor),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Sign in',
                      style: Fonts.smallerTextSemiBold
                          .copyWith(color: ColorStyles.secondary100Color),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
