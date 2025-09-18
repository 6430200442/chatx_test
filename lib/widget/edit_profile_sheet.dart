import 'package:flutter/material.dart';

class EditProfileSheet extends StatelessWidget {
  const EditProfileSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // ให้ BottomSheet หดตามเนื้อหา
      children: [
        ListTile(
          leading: const Icon(Icons.camera),
          title: const Text('Camera'),
          onTap: () {
            // TODO: เปิดกล้อง
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.photo),
          title: const Text('Select Picture'),
          onTap: () {
            // TODO: เลือกรูปจาก Gallery
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const Text('Delete Picture'),
          onTap: () {
            // TODO: ลบรูปโปรไฟล์
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: TextButton(
            onPressed: () {
              Navigator.pop(context); // ปิด BottomSheet
            },
            child: const Text('Cancel'),
          ),
        ),
      ],
    );
  }
}
