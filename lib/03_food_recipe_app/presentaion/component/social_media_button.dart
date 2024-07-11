import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';

class SocialMediaButton extends StatelessWidget {
  final String imagePath;
  final void Function() onTap;

  const SocialMediaButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: ColorStyles.whiteColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: ColorStyles.blackColor.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ],
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
