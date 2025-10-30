import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/confirm_button.dart';
// import 'package:chatx_test/widget/create_group_button.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
// import 'package:chatx_test/widget/input_field.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  final TextEditingController groupNameController = TextEditingController();

  @override
  void dispose() {
    groupNameController.dispose();
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
        title: const Text('Create Group'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 14),
              const Text(
                "Please enter your group name to create a new group",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 16),
              const Text(
                "Group Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: groupNameController,
                    decoration: const InputDecoration(
                      hintText: "Enter group name",
                      hintStyle: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ConfirmButton(
                  onPressed: () {
                    final groupName = groupNameController.text.trim();
                    if (groupName.isNotEmpty) {
                      Navigator.pop(context, groupName); // ส่งค่ากลับ
                    }
                  },
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
