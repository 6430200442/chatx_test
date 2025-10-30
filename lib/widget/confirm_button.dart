import 'package:chatx_test/constant/app_constants.dart';
import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ConfirmButton({
    super.key,
    required this.onPressed,
    this.text = 'ยืนยัน',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(text,
          style: const TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }
}
