import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ChannelManagePage extends StatefulWidget {
  const ChannelManagePage({super.key});

  @override
  State<ChannelManagePage> createState() => _ChannelManagePageState();
}

class _ChannelManagePageState extends State<ChannelManagePage> {
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
      body: const Center(child: Text("นี่คือหน้าแชแนล")),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }
}