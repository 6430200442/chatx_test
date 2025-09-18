import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chatx_test/controller/profile_controller.dart';

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key});

  Future<void> _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

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
          onTap: () {
            // TODO: เปิดกล้อง (เหมือน pickImage แต่ source: camera)
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('Select Picture'),
          onTap: () => _pickImage(context),
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
