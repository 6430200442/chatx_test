import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/confirm_button.dart';
// import 'package:chatx_test/widget/create_group_button.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:chatx_test/widget/input_field.dart';
import 'package:flutter/material.dart';

class CreateMember extends StatefulWidget {
  final String groupName;
  const CreateMember({super.key, required this.groupName});

  @override
  State<CreateMember> createState() => _CreateMemberState();
}

class _CreateMemberState extends State<CreateMember> {
  final TextEditingController memberNameController = TextEditingController();

  @override
  void dispose() {
    memberNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.backButton),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: const Text('Create Member'),
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
                    Center(
                        child: Column(
                      children: [
                        Text('Group ${widget.groupName}',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        const Text('เพิ่มสมาชิกกลุ่ม',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                      ],
                    )),
                    const SizedBox(height: 35),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            'กรอก Email เพื่อส่งลิงค์คำชวนเข้ากลุ่ม',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold))),
                    InputField(controller: memberNameController),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ConfirmButton(
                        onPressed: () {
                          final memberName = memberNameController.text.trim();
                          if (memberName.isNotEmpty) {
                            Navigator.pop(context, memberName); // ส่งค่ากลับ
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
