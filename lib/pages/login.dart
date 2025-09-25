// lib/pages/login_page.dart
import 'package:flutter/material.dart';
import '../widget/login_form.dart';
import '../constant/app_constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // เปิดให้ layout ขยับตามคีย์บอร์ด
      body: Stack(
        children: [
          // ภาพพื้นหลัง
          Positioned.fill(
            child: Image.asset(
              AppConstants.backgroundLogin,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Padding(
                        padding:
                            const EdgeInsets.all(AppConstants.defaultPadding),
                        child: Column(
                          children: [
                            const SizedBox(height: 100),
                            Image.asset(
                              AppConstants.logoLogin,
                              width: MediaQuery.of(context).size.width,
                            ),
                            // const SizedBox(height: 30),
                            // const Text(
                            //   "ADMIN",
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 20,
                            //   ),
                            // ),
                            const SizedBox(height: 30),
                            const LoginForm(),
                            const SizedBox(height: 20),
                            
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
