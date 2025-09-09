import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String content;
  final String confirmText;
  final VoidCallback onConfirm;

  const DeleteDialog({
    super.key,
    required this.title,
    required this.content,
    required this.confirmText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      content: Text(content, style: const TextStyle(fontSize: 13)),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("ยกเลิก", style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const SizedBox(width: 40),
            TextButton(
              onPressed: () {
                onConfirm();
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(confirmText, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ],
        ),
      ],
    );
  }
}
