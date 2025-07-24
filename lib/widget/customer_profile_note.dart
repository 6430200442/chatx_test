import 'package:chatx_test/widget/profile_note_edit.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/model/customer_profile.dart';

class CustomerProfileNote extends StatefulWidget {
  final CustomerProfile profile;
  
  const CustomerProfileNote({Key? key, required this.profile})
      : super(key: key);

  @override
  State<CustomerProfileNote> createState() => _CustomerProfileNoteState();
}

class _CustomerProfileNoteState extends State<CustomerProfileNote> {
  bool isEditing = false;

  final TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    noteController.text = widget.profile.customerNote;
  }

  @override
  void dispose() {
    noteController.dispose();
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
        ProfileNoteEdit(
            label: 'Note',
            controller: noteController,
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
