import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/bottom_nav_bar.dart';
// import 'package:chatx_test/widget/create_group_button.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: const Text('Group Manage'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  children: [
                    Center(child: Text('สร้างกลุ่ม')),
                    Text('ใส่อีเมล'),
                    //ตรงนี้ต้องเพิ่มฟิลดืกรอกอีเมล
                    Text('กรอก'),
                    // ปุ่มยืนยีน ชิดขวา
                    Align(
                      child: 
                        Text('ยืนยัน'),
                        
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: CreateGroupButton(onPressed:() {} ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      backgroundColor: AppColors.primaryColor,
    );
  }
}