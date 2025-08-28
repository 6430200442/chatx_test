import 'package:flutter/material.dart';

class CreateGroupButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CreateGroupButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed, 
      backgroundColor: Colors.grey,
      child: const Icon(Icons.group_add_rounded),
      );
  }
}