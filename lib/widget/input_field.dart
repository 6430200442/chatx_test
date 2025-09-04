import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const InputField({
    super.key,
    required this.controller,
    this.label = 'กรอกชื่อ...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          border: InputBorder.none, // ไม่มีกรอบ
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintStyle: const TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),
      ),
    );
  }
}
