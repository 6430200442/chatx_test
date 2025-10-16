import 'package:chatx_test/app.dart';
import 'package:chatx_test/model/user_login.dart';
import 'package:chatx_test/pages/forgot_password_email.dart';
// import 'package:chatx_test/pages/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/data/mock_user_login_data.dart';
// import 'package:chatx_test/crypto/key_manager.dart';
// import 'package:chatx_test/crypto/encryption_utils.dart';
// import 'package:chatx_test/api/key_exchange_service.dart';
// import 'package:chatx_test/crypto/secure_storage.dart';
import 'dart:convert';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  // String? error;
  String? emailError;
  String? passwordError;

  Future<void> _login() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    final user = mockUsers.firstWhere(
      (u) => u.email == email,
      orElse: () => User(email: '', password: ''),
    );

    if (user.email.isEmpty) {
      // อีเมลไม่ถูกต้อง
      setState(() {
        emailError = 'Invalid email';
        passwordError = null;
      });
    } else if (user.password != password) {
      // รหัสผ่านผิด
      setState(() {
        emailError = null;
        passwordError = 'Invalid password';
      });
    } else {
      // เข้าสู่ระบบสำเร็จ
      setState(() {
        emailError = null;
        passwordError = null;
      });

      // //ขั้นตอนที่ 1: สร้างคู่กุญแจ
      // final keyManager = KeyManager();
      // await keyManager.generateKeyPair();
      // final clientPublicKey = await keyManager.getPublicKeyBase64();
      // // Debug: ตรวจสอบว่ามีกุญแจจริงไหม
      // print('Client public key (Base64): $clientPublicKey');
      // print('Client key pair: ${keyManager.keyPair}');

      // //ขั้นตอนที่ 2: แลกเปลี่ยนกุญแจ
      // final keyExchangeService = KeyExchangeService();
      // final serverPublicKeyBase64 =
      //     await keyExchangeService.exchangeKeys(clientPublicKey);
      // print('clientPublicKey length: ${clientPublicKey.length}');
      // print('serverPublicKeyBase64: $serverPublicKeyBase64');

      // //ขั้นตอนที่ 3: สร้าง derived key ถ้ามี server key
      // if (serverPublicKeyBase64 != null) {
      //   final derivedKey =
      //       await deriveSharedKey(keyManager.keyPair, serverPublicKeyBase64);

      //   final derivedKeyBase64 = base64Encode(derivedKey);
      //   print('Derived Key Created: $derivedKeyBase64');

      //   //ขั้นตอนที่ 4: เก็บใน SecureStorage
      //   await SecureStorageHelper.saveDerivedKey(derivedKeyBase64);
      //   print('Derived Key Saved to SecureStorage');
      // } else {
      //   print('Key Exchange Failed');
      // }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
        (route) => false, // ล้าง stack เก่าออก
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: 50,
          child: TextField(
            controller: emailController,
            style: TextStyle(
              color: emailError != null ? Colors.red : Colors.black,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.people),
              hintText: 'Username',
              // labelText: 'Username02',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              // errorText: emailError,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              emailError == null ? '' : emailError!,
              style: TextStyle(
                color:
                    emailError == null ? Colors.white : Colors.redAccent[700],
              ),
            ),
            const Spacer(),
            const Text(
              'Username must be email',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          // height: 50,
          child: TextField(
            controller: passwordController,
            obscureText: _obscurePassword,
            style: TextStyle(
              color: passwordError != null ? Colors.red : Colors.black,
            ),
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              hintText: 'Password',
              // labelText: 'Password',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ), // ไม่มีขอบ

              // errorText: passwordError,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              passwordError == null ? '' : passwordError!,
              style: TextStyle(
                color: passwordError == null ? Colors.white : Colors.red[900],
              ),
            ),
            const Spacer(),
            const Text(
              'At least 8 characters',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ForgotPasswordEmailPage(),
                ),
              );
            },
            child: const Text(
              'Forgot password',
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
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
