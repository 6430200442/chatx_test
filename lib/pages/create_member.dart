import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/confirm_button.dart';
// import 'package:chatx_test/widget/create_group_button.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
// import 'package:chatx_test/widget/input_field.dart';
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
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 14),
                    Text('Group ${widget.groupName}',
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    const Text(
                      "Please enter email to invite member to the group",
                      style: TextStyle(
                          fontSize: 13, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Email",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: memberNameController,
                        decoration: const InputDecoration(
                          hintText: "Enter member email",
                          hintStyle: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
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
