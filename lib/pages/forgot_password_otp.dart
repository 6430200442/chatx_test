import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'forgot_password_confirm.dart';

class ForgotPasswordOtpPage extends StatefulWidget {
  const ForgotPasswordOtpPage({super.key});

  @override
  State<ForgotPasswordOtpPage> createState() => _ForgotPasswordOtpPageState();
}

class _ForgotPasswordOtpPageState extends State<ForgotPasswordOtpPage> {
  final int otpLength = 6;
  late List<TextEditingController> otpControllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();
    otpControllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in otpControllers) c.dispose();
    for (final f in focusNodes) f.dispose();
    super.dispose();
  }

  bool get isOtpFilled =>
      otpControllers.every((c) => c.text.isNotEmpty && c.text.length == 1);

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      //ป้องกันการพิมพ์หลายตัว
      otpControllers[index].text = value[0];
    }
    if (value.isNotEmpty && index < otpLength - 1) {
      //ถ้ากรอกตัวเลข ให้ไปยังโฟกัสถัดไป
      focusNodes[index + 1].requestFocus();
    }
    if (value.isEmpty && index > 0) {
      //ถ้าลบตัวเลข ให้มายังโฟกัสก่อนหน้า
      focusNodes[index - 1].requestFocus();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.backButton),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: const Text('Forgot Password'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                const Text(
                  "Check your email",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Text(
                  'We sent a reset link to your email address.',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                ),
                const Text(
                  "Enter 6 digit code mentioned in the email.",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(otpLength, (index) {
                    return SizedBox(
                      width: 40,
                      height: 50,
                      child: TextField(
                        controller: otpControllers[index],
                        focusNode: focusNodes[index],
                        maxLength: 1,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) => _onChanged(value, index),
                        decoration: const InputDecoration(
                          counterText: "",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isOtpFilled
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const ForgotPasswordConfirmPage(),
                              ),
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isOtpFilled
                          ? AppColors.primaryColor
                          : Colors.blue[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Verify Code",
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Haven't got the email yet?",
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: const Text(
                        "Resend Email",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
