import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class GroupManagePage extends StatefulWidget {
  const GroupManagePage({super.key});

  @override
  State<GroupManagePage> createState() => _GroupManagePageState();
}

class _GroupManagePageState extends State<GroupManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          title: const Text('ChatX'),
        ),
      body: const Center(child: Text("นี่คือหน้าจัดการกลุ่ม")),
      bottomNavigationBar: const BottomNavBar(currentIndex: 2),
    );
  }
}