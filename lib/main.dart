import 'package:flutter/material.dart';
import 'package:learn_flutter/01_widget_rule/data/model/ingrident.dart';
import 'package:learn_flutter/01_widget_rule/data/model/profile.dart';

import '01_widget_rule/presentation/component/profile_widget.dart';
import '01_widget_rule/presentation/component/ingrident_item_widget.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _ingrident = const Ingrident(
    imageUrl:
        'https://cdn.pixabay.com/photo/2019/07/03/20/56/tomatoes-4315442_1280.png',
    name: 'Tomatos',
    weight: '500',
  );

  final _profile = const Profile(
    imageUrl:
        'https://cdn.pixabay.com/photo/2020/06/25/16/25/micky-mouse-5340128_1280.jpg',
    name: '미키마우스',
    locationName: 'Lagos,Nigeria',
  );

  bool _isFollow = false;

  void _toggleFollow(String message) {
    setState(() {
      _isFollow = !_isFollow;
    });
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            '토마토',
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // body: IngridentItem(
        //   ingrident: _ingrident,
        // ),
        body: CreatorProfile(
          profile: _profile,
          onFollowTap: _toggleFollow,
          isFollow: _isFollow,
        ),
        //body: RecipeCardWidget(),
      ),
    );
  }
}
