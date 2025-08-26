import 'package:flutter/material.dart';

class CreateGroupButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CreateGroupButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return const FloatingActionButton(
      onPressed: null, /*ยังไม่เสร็จ*/
      backgroundColor: Colors.grey,
      child: Icon(Icons.group_add_rounded),
      );
  }
}