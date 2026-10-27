/// Pure logic (không UI) để dễ viết unit test, giống Counter/Calculator.
class AuthService {
  final Map<String, String> _users = {}; // email -> password

  void register(String email, String password) {
    if (!email.contains('@')) {
      throw ArgumentError('Email không hợp lệ');
    }
    if (password.length < 6) {
      throw ArgumentError('Mật khẩu phải có ít nhất 6 ký tự');
    }
    if (_users.containsKey(email)) {
      throw StateError('Email đã được đăng ký');
    }
    _users[email] = password;
  }

  bool login(String email, String password) {
    return _users[email] == password;
  }
}
