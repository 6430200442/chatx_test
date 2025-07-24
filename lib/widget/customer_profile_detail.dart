import 'package:chatx_test/widget/profile_detail_edit.dart';
import 'package:flutter/material.dart';

class CustomerProfileDetail extends StatefulWidget {
  const CustomerProfileDetail({super.key});

  @override
  State<CustomerProfileDetail> createState() => _CustomerProfileDetailState();
}

class _CustomerProfileDetailState extends State<CustomerProfileDetail> {
  bool isEditing = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;

      if (!isEditing) {
        //print('Saved: ${nameController.text},${lastNameController.text}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
                child: ProfileDetailEdit(
                    label: 'Name',
                    controller: nameController,
                    isEditing: isEditing)),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: ProfileDetailEdit(
                    label: 'Last Name',
                    controller: lastNameController,
                    isEditing: isEditing)),
          ],
        ),
        ProfileDetailEdit(
            label: 'Phone',
            controller: phoneController,
            isEditing: isEditing),
        ProfileDetailEdit(
            label: 'Email',
            controller: emailController,
            isEditing: isEditing),
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: toggleEditing,
              child: Text(
                isEditing ? 'บันทึก' : 'แก้ไข',
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey,
                ),
              ),
            ),
            ),
        const Divider(height: 24,),
      ],
    );
  }
}
