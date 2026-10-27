import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_and_debugging/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Đăng ký rồi đăng nhập trên app thật', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byKey(const Key('emailField')), 'a@gmail.com');
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');
    await tester.tap(find.byKey(const Key('registerButton')));
    await tester.pumpAndSettle();

    expect(find.text('Đăng ký thành công'), findsOneWidget);

    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pumpAndSettle();

    expect(find.text('Đăng nhập thành công'), findsOneWidget);
  });
}
