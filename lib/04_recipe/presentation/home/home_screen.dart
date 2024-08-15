import 'package:flutter/material.dart';
import 'package:learn_flutter/04_recipe/di/di_setup.dart';
import 'package:learn_flutter/04_recipe/presentation/home/home_content_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/notification/notification_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/profile/profile_screen.dart';
import 'package:learn_flutter/04_recipe/presentation/saved_recipe/saved_recipe_screen_root.dart';
import 'package:provider/provider.dart';

import '../../../router/router.dart';
import 'home_content_view_model.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ChangeNotifierProvider<HomeContentViewModel>(
        create: (context) => getIt(),
        child: const HomeContentScreen(),
      ),
      const SavedRecipeScreenRoot(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
    return MaterialApp(
      home: Scaffold(
        body: screens[_selectedIndex],
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
