import 'package:flutter/material.dart';

class CloseButtonLabel extends StatelessWidget {
  final VoidCallback onPressed;

  const CloseButtonLabel({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
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
      ),
    );
    // TextButton(
    //   style: TextButton.styleFrom(
    //     backgroundColor: Colors.black,
    //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(10.0),
    //       side: const BorderSide(color: Colors.white),
    //       boxShadow: [
    //         BoxShadow(
    //           color: Colors.grey.withOpacity(0.2),
    //           spreadRadius: 1,
    //           blurRadius: 5,
    //           offset: const Offset(0, 3),
    //         ),
    //       ],
    //     ),
    //     foregroundColor: Colors.white, // สีตัวอักษร
    //   ),
    //   onPressed: onPressed,
    //   child: const Text("Close"),
    // );
    
  }
}

