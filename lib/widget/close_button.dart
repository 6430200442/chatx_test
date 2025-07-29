import 'package:flutter/material.dart';

class CloseButtonLabel extends StatelessWidget {
  final VoidCallback onPressed;

  const CloseButtonLabel({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: const BorderSide(color: Colors.white),
        ),
        foregroundColor: Colors.white, // สีตัวอักษร
      ),
      onPressed: onPressed,
      child: const Text("Close"),
    );
  }
}

