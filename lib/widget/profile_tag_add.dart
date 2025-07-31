import 'package:flutter/material.dart';
// import 'package:chatx_test/widget/profile_tag_edit.dart';

class ProfileTagAdd extends StatelessWidget {
  final VoidCallback onTap;
  const ProfileTagAdd({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
