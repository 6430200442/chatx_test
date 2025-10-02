import 'package:flutter/material.dart';
import 'package:chatx_test/data/mock_user_login_data.dart';

class PasswordDialog extends StatefulWidget {
  final String title;
  final String selectedChannel;
  final String groupName;
  final VoidCallback onConfirm;

  const PasswordDialog({
    super.key,
    required this.title,
    required this.selectedChannel,
    required this.groupName,
    required this.onConfirm,
  });

  @override
  State<PasswordDialog> createState() => _PasswordDialogState();
}

class _PasswordDialogState extends State<PasswordDialog> {
  final TextEditingController passwordController = TextEditingController();
  late final String correctPassword;

  @override
  void initState() {
    super.initState();
    correctPassword = mockUsers.first.password; // ใช้ mock password
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Center(
        child: Text(widget.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Channel", style: TextStyle(fontSize: 13)),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Text(widget.selectedChannel,
                  style: const TextStyle(fontSize: 13)),
            ),
            const SizedBox(height: 8),
            const Text("Name", style: TextStyle(fontSize: 13)),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.all(8),
              color: Colors.grey[200],
              child: Text(widget.groupName, style: const TextStyle(fontSize: 13)),
            ),
            const SizedBox(height: 8),
            const Text("Password", style: TextStyle(fontSize: 13)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.grey[200],
              child: TextField(
                controller: passwordController,
                style: const TextStyle(fontSize: 13),
                obscureText: true,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter password",
                  hintStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                if (passwordController.text == correctPassword) {
                  widget.onConfirm();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("Password incorrect",
                            style: TextStyle(fontSize: 13))),
                  );
                }
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const SizedBox(width: 40),
            TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Cancel",
                  style: TextStyle(color: Colors.white, fontSize: 12)),
            ),
          ],
        ),
      ],
    );
  }
}
