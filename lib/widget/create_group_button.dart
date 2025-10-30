import 'package:chatx_test/constant/app_constants.dart';
import 'package:flutter/material.dart';

class CreateGroupButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CreateGroupButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: FloatingActionButton(
        onPressed: onPressed, 
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.group_add_rounded, color: Colors.white,),
        ),
    );
  }
}