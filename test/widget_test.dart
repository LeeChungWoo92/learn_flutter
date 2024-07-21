// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learn_flutter/01_widget_rule/data/model/profile.dart';
import 'package:learn_flutter/04_recipe/presentation/component/profile_widget.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('ProfileWidget test', (WidgetTester tester) async {
    const profile = Profile(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/06/25/16/25/micky-mouse-5340128_1280.jpg',
      name: '미키마우스',
      locationName: 'Lagos, Nigeria',
    );
    bool isFollow = false;

    void onFollowTap(String message) {
      isFollow = !isFollow;
    }

    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(
        StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MaterialApp(
              home: Scaffold(
                body: ProfileWidget(
                  profile: profile,
                  onFollowTap: (message) {
                    setState(() {
                      onFollowTap(message);
                    });
                  },
                  isFollow: isFollow,
                ),
              ),
            );
          },
        ),
      );

      expect(find.text('미키마우스'), findsOneWidget);
      expect(find.text('Lagos, Nigeria'), findsOneWidget);
      expect(find.text('UnFollow'), findsNothing);
      expect(find.text('Follow'), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(isFollow, true);
      expect(find.text('UnFollow'), findsOneWidget);
      expect(find.text('Follow'), findsNothing);
    });
  });
}
