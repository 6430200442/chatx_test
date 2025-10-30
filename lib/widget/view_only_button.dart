import 'package:flutter/material.dart';

class ViewOnlyButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ViewOnlyButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 14, 80, 223),
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          foregroundColor: Colors.white, // สีตัวอักษร
        ),
        onPressed: onPressed,
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.remove_red_eye_rounded, // ไอคอนหน้าคำ
              size: 16, 
              color: Colors.white,
            ),
            SizedBox(width: 2),
            Text(
              "View Only",
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
