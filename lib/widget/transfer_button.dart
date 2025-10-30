import 'package:flutter/material.dart';

class TransferButton extends StatelessWidget {
  final VoidCallback onPressed;

  const TransferButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          foregroundColor: Colors.black, // สีตัวอักษร
        ),
        onPressed: onPressed,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.person, // ไอคอนหน้าคำ
              size: 16, 
              color: Colors.black,
            ),
            SizedBox(width: 2),
            Text(
              "Transfer",
              style: TextStyle(
                fontSize: 12,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
