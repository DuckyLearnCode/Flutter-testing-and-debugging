import 'package:flutter_test/flutter_test.dart';
import 'package:test_and_debugging/auth_service.dart';

void main() {
  late AuthService auth;

  setUp(() {
    auth = AuthService();
  });

  group('register', () {
    test('đăng ký thành công với email và mật khẩu hợp lệ', () {
      auth.register('a@gmail.com', '123456');
      expect(auth.login('a@gmail.com', '123456'), isTrue);
    });

    test('báo lỗi khi email không có @', () {
      expect(() => auth.register('a-gmail.com', '123456'), throwsArgumentError);
    });

    test('báo lỗi khi mật khẩu ngắn hơn 6 ký tự', () {
      expect(() => auth.register('a@gmail.com', '123'), throwsArgumentError);
    });

    test('báo lỗi khi email đã được đăng ký', () {
      auth.register('a@gmail.com', '123456');
      expect(() => auth.register('a@gmail.com', 'khackhau1'), throwsStateError);
    });
  });

  group('login', () {
    test('đăng nhập đúng mật khẩu trả về true', () {
      auth.register('a@gmail.com', '123456');
      expect(auth.login('a@gmail.com', '123456'), isTrue);
    });

    test('đăng nhập sai mật khẩu trả về false', () {
      auth.register('a@gmail.com', '123456');
      expect(auth.login('a@gmail.com', 'saimatkhau'), isFalse);
    });

    test('đăng nhập với email chưa đăng ký trả về false', () {
      expect(auth.login('chua-dang-ky@gmail.com', '123456'), isFalse);
    });
  });
}
