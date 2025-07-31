import 'package:chatx_test/model/user_login.dart';
import 'package:chatx_test/pages/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/data/mock_user_login_data.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? error;

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;

    final user = mockUsers.firstWhere(
      (u) => u.email == email && u.password == password,
      orElse: () => User(email: '', password: ''),
    );

    if (user.email.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ChatListPage()),
      );
    } else {
      setState(() {
        error = 'Invalid email or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: 30,
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Username',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Username must be email',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: 70,
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ), // ไม่มีขอบ
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: Text(
            'Password must be at least 8 characters',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.centerRight,
          child: TextButton(onPressed: null,
          child: Text(
            'forgot password',
            style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white),
          ),
          ),
        ),
        const SizedBox(height: 10),
        if (error != null)
          Text(error!, style: const TextStyle(color: Colors.red)),
        // const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 80,
          child: ElevatedButton(
            onPressed: _login,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // ไม่มีขอบมน
                side: BorderSide.none, // ไม่มีขอบ
              ),
              elevation: 0,
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
