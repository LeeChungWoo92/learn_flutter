import 'package:flutter/material.dart';

class SnackBarUtils {
  static void showLinkCopiedSnackBar(BuildContext context, String message) {
    const snackBar = SnackBar(
      content: Center(
          child: Text(
            'Link Copied',
            style: TextStyle(color: Colors.black),
          )),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      width: 120,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}