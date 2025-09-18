import 'dart:io';
import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/profile_controller.dart';
import 'package:chatx_test/widget/edit_profile_sheet.dart';
import 'package:flutter/material.dart';

class ProfileViewPage extends StatefulWidget {
  const ProfileViewPage({super.key});

  @override
  State<ProfileViewPage> createState() => _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {
  @override
  void initState() {
    super.initState();
    profileController.addListener(_refresh);
  }

  @override
  void dispose() {
    profileController.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final File? profileImage = profileController.profileImage;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
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
      body: Center(
        child: profileImage != null
            ? Image.file(profileImage, fit: BoxFit.contain)
            : Image.asset(OwnerInfo.ownerImage, fit: BoxFit.contain),
      ),
    );
  }
}
