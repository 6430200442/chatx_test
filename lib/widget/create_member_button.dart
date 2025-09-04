import 'package:flutter/material.dart';

class CreateMemberButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CreateMemberButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        onPressed: onPressed, 
        backgroundColor: Colors.grey.shade200,
        shape: const CircleBorder(),
        child: const Icon(Icons.person_add_alt_1),
        ),
    );
  }
}