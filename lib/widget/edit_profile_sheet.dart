import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chatx_test/controller/profile_controller.dart';

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key});

  // ฟังก์ชันเลือกภาพจาก Gallery
  Future<void> _pickFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      profileController.updateProfileImage(File(picked.path));
    }
    Navigator.pop(context);
  }

  // ฟังก์ชันถ่ายภาพจาก Camera
  Future<void> _pickFromCamera(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      profileController.updateProfileImage(File(picked.path));
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text('Camera'),
          onTap: () => _pickFromCamera(context),
        ),
        ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('Select Picture'),
          onTap: () => _pickFromGallery(context),
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Delete Picture'),
          onTap: () {
            profileController.deleteProfileImage();
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
