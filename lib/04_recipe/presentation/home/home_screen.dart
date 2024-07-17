import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_flutter/04_recipe/data/datasource/recipe_datasource_impl.dart';
import 'package:learn_flutter/04_recipe/data/model/recipe.dart';
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository.dart';
import 'package:learn_flutter/04_recipe/data/repository/recipe_repository_impl.dart';
import 'package:learn_flutter/04_recipe/presentation/home/home_content_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/notification/notification_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/profile/profile_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_screen.dart';

import '../saved_recipe/saved_recipe_detail_screen.dart';

void main() {
  final recipeDatasourceImpl = RecipeDatasourceImpl();
  final recipeRepositoryImpl = RecipeRepositoryImpl(recipeDatasourceImpl);

  //runApp(HomeScreen(recipeRepository: recipeRepositoryImpl));
  runApp(MyApp(recipeRepository: recipeRepositoryImpl));
}

class MyApp extends StatelessWidget {
  final RecipeRepositoryImpl recipeRepository;

  const MyApp({
    super.key,
    required this.recipeRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/home',
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) {
              return HomeScreen(recipeRepository: recipeRepository);
            },
          ),
          GoRoute(
            path: '/saved_recipe',
            builder: (context, state) {
              final recipeRepository = state.extra as RecipeRepository;
              return SavedRecipeScreen(recipeRepository: recipeRepository);
            },
          ),
          GoRoute(
            path: '/recipe_detail',
            builder: (context, state) {
              final recipe = state.extra as Recipe;
              return SavedRecipeDetailScreen(recipe: recipe);
            },
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final RecipeRepositoryImpl recipeRepository;

  const HomeScreen({
    super.key,
    required this.recipeRepository,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeContentScreen(),
      SavedRecipeScreen(recipeRepository: widget.recipeRepository),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/home_selected.png'),
                icon: Image.asset(
                  'assets/home_default.png',
                  width: 24,
                  height: 24,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/bookmark_selected.png'),
                icon: Image.asset(
                  'assets/bookmark_default.png',
                  width: 24,
                  height: 24,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/notification_selected.png'),
                icon: Image.asset(
                  'assets/notification_default.png',
                  width: 24,
                  height: 24,
                ),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Image.asset('assets/profile_selected.png'),
                icon: Image.asset(
                  'assets/profile_default.png',
                  width: 24,
                  height: 24,
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
