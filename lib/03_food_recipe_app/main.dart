import 'package:flutter/material.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/sign_up/sign_up_screen.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: SignUpScreen(),
      ),
    );
  }
}
