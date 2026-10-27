import 'package:flutter/material.dart';

import 'auth_service.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _auth = AuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _message = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() {
    try {
      _auth.register(_emailController.text, _passwordController.text);
      setState(() => _message = 'Đăng ký thành công');
    } catch (e) {
      setState(() => _message = 'Lỗi: ${e is Error ? e.toString() : e}');
    }
  }

  void _login() {
    final ok = _auth.login(_emailController.text, _passwordController.text);
    setState(() => _message = ok ? 'Đăng nhập thành công' : 'Sai email hoặc mật khẩu');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Đăng nhập / Đăng ký')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              key: const Key('emailField'),
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 12),
            TextField(
              key: const Key('passwordField'),
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Mật khẩu'),
              obscureText: true,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  key: const Key('registerButton'),
                  onPressed: _register,
                  child: const Text('Đăng ký'),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  key: const Key('loginButton'),
                  onPressed: _login,
                  child: const Text('Đăng nhập'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(_message, key: const Key('messageText')),
          ],
        ),
      ),
    );
  }
}
