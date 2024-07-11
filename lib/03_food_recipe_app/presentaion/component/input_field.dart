import 'package:flutter/material.dart';

import '../../ui/color_styles.dart';
import '../../ui/fonts.dart';

class InputField extends StatelessWidget {
  final String titleText;
  final String hintText;
  final bool obscureText;

  const InputField({
    super.key,
    required this.titleText,
    required this.hintText,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          titleText,
          style: Fonts.smallTextRegular,
        ),
        const SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: ColorStyles.gray4Color),
          ),
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Fonts.smallerTextRegular.copyWith(
                color: ColorStyles.gray4Color,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 19,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
