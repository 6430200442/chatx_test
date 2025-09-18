import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/pages/profile_view.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.backButton),
        backgroundColor: Colors.transparent, // ทำให้โปร่งใส
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              // TODO: ใส่ action เวลากดตั้งค่า เช่น เปิดหน้า SettingsPage
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const SettingsPage(), // <- หน้า settings
              //   ),
              // );
            },
          ),
          const SizedBox(width: 5),
          IconButton(
            icon: const Icon(Icons.manage_accounts, color: Colors.white),
            onPressed: () {
              // TODO: ใส่ action เวลากดหัวใจ เช่น favorite
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/imgs/rectangle.png"),
            fit: BoxFit.cover, // ปรับรูปให้เต็มจอ
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดกึ่งกลางแนวตั้ง
            crossAxisAlignment: CrossAxisAlignment.center, // จัดกึ่งกลางแนวนอน
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProfileViewPage(),
                    ),
                  );
                },
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(OwnerInfo.ownerImage),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                OwnerInfo.ownerUserName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                OwnerInfo.ownerRole,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
