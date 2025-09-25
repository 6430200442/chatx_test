import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/profile_controller.dart';
import 'package:chatx_test/pages/login.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:chatx_test/widget/setting_item.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Logout?",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          content: const Text("Are you sure want to log out?",
              style: TextStyle(fontSize: 13)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Cancel",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                const SizedBox(width: 40),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                      (route) => false, // ล้าง stack เก่าออก
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("Logout",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: AppColors.backButton),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: profileController.currentImage,
            ),
            const SizedBox(width: 12),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  OwnerInfo.ownerUserName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  OwnerInfo.ownerRole,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              SettingMenuItem(
                icon: Icons.person,
                title: 'Edit Personal Information',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.face,
                title: 'Identification',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.credit_card,
                title: 'My credit/debit card',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.lock,
                title: 'Change Password',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.devices_outlined,
                title: 'Login History',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.report_problem,
                title: 'Report usage problems',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.build,
                title: 'Terms of Service and Privacy Policy',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.language,
                title: 'Language',
                onTap: () {},
              ),
              SettingMenuItem(
                icon: Icons.power_settings_new,
                title: 'Logout',
                color: Colors.red,
                onTap: () {
                  _showLogoutDialog();
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
