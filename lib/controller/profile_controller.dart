import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chatx_test/constant/app_constants.dart';

class ProfileController extends ChangeNotifier {
  File? _profileImage; // เก็บไฟล์จาก camera/gallery
  String? _assetImage = OwnerInfo.ownerImage; // เก็บ mock asset image เริ่มต้น

  // คืนค่ารูป
  ImageProvider get currentImage {
    if (_profileImage != null) {
      return FileImage(_profileImage!);
    }
    if (_assetImage != null && _assetImage!.isNotEmpty) {
      return AssetImage(_assetImage!);
    }
    return const AssetImage("assets/imgs/user_blue.png");
  }

  // อัปเดตรูปจากกล้อง/แกลเลอรี
  void updateProfileImage(File newImage) {
    _profileImage = newImage;
    notifyListeners();
  }

  // ลบรูป (กลับไปใช้ default asset)
  void deleteProfileImage() {
    _profileImage = null;
    _assetImage = "assets/imgs/user_blue2.png";
    notifyListeners();
  }

  // รีเซ็ต asset (ใช้ตอนโหลดข้อมูลจาก OwnerInfo ใหม่)
  void setAssetImage(String assetPath) {
    _assetImage = assetPath;
    _profileImage = null;
    notifyListeners();
  }
}

final profileController = ProfileController(); // global instance
