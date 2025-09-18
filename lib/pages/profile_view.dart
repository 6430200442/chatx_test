import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/edit_profile_sheet.dart';
import 'package:flutter/material.dart';

class ProfileViewPage extends StatelessWidget {
  const ProfileViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white), // กากบาท
          onPressed: () {
            Navigator.pop(context); // ปิดหน้านี้แล้วกลับไปหน้าก่อนหน้า
          },
        ),
        backgroundColor: Colors.transparent, // ทำให้โปร่งใส
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const EditProfileSheet(),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemBuilder: (context, index) {
              return Center(
                child: Image.asset(
                  OwnerInfo.ownerImage,
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
