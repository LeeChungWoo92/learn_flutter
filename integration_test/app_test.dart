import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:learn_flutter/03_food_recipe_app/presentaion/component/input_field.dart';
import 'package:learn_flutter/04_recipe/presentation/home/home_screen.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('회원가입 정보입력', (tester) async {

    await tester.pumpWidget(const MyApp());
    expect(find.text('Create an account'), findsOneWidget);

    await tester.pumpAndSettle();

    final nameField = find.byWidgetPredicate(
          (widget) => widget is InputField && widget.titleText == 'Name',
    );
    final emailField = find.byWidgetPredicate(
          (widget) => widget is InputField && widget.titleText == 'Email',
    );
    final passwordField = find.byWidgetPredicate(
          (widget) => widget is InputField && widget.titleText == 'Password',
    );
    final confirmPasswordField = find.byWidgetPredicate(
          (widget) => widget is InputField && widget.titleText == 'Confirm Password',
    );
    await tester.enterText(nameField, 'ChungWoo');
    await tester.enterText(emailField, 'test@test.co.kr');
    await tester.enterText(passwordField, 'asdqwe123@');
    await tester.enterText(confirmPasswordField, 'asdqwe123@');

    await tester.tap(find.text('Sign Up'));
    // 페이지 로드 및 요소 찾기
    await tester.pumpAndSettle();
    //expect(find.text('What are you cooking today?'), findsOneWidget);

  });
}
