import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_and_debugging/auth_page.dart';

void main() {
  testWidgets('đăng ký rồi đăng nhập thành công', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));

    await tester.enterText(find.byKey(const Key('emailField')), 'a@gmail.com');
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');
    await tester.tap(find.byKey(const Key('registerButton')));
    await tester.pump();

    expect(find.text('Đăng ký thành công'), findsOneWidget);

    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    expect(find.text('Đăng nhập thành công'), findsOneWidget);
  });

  testWidgets('đăng nhập sai mật khẩu hiện thông báo lỗi', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AuthPage()));

    await tester.enterText(find.byKey(const Key('emailField')), 'a@gmail.com');
    await tester.enterText(find.byKey(const Key('passwordField')), '123456');
    await tester.tap(find.byKey(const Key('registerButton')));
    await tester.pump();

    await tester.enterText(find.byKey(const Key('passwordField')), 'saimatkhau');
    await tester.tap(find.byKey(const Key('loginButton')));
    await tester.pump();

    expect(find.text('Sai email hoặc mật khẩu'), findsOneWidget);
  });
}
