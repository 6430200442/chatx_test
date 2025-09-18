// import 'dart:io';
// import 'package:chatx_test/constant/app_constants.dart';
// import 'package:flutter/material.dart';

// class ProfileController extends ChangeNotifier {
//   File? _profileImage;

//   ProfileController() {
//     // ถ้ามี ownerImage ตั้งค่าเป็นค่าเริ่มต้น
//     if (OwnerInfo.ownerImage != null && OwnerInfo.ownerImage!.isNotEmpty) {
//       _profileImage = File(OwnerInfo.ownerImage!);
//     }
//   }

//   File? get profileImage => _profileImage;

//   void updateProfileImage(File? newImage) {
//     _profileImage = newImage;
//     notifyListeners();
//   }

//   void deleteProfileImage() {
//     _profileImage = null;
//     notifyListeners();
//   }
// }

// final profileController = ProfileController(); // ใช้งานแบบ global 


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:chatx_test/constant/app_constants.dart';

class ProfileController extends ChangeNotifier {
  File? _profileImage; // เก็บไฟล์จาก camera/gallery
  String? _assetImage = OwnerInfo.ownerImage; // เก็บ asset image เริ่มต้น

  /// คืนค่ารูปที่ควรใช้
  ImageProvider get currentImage {
    if (_profileImage != null) {
      return FileImage(_profileImage!);
    }
    if (_assetImage != null && _assetImage!.isNotEmpty) {
      return AssetImage(_assetImage!);
    }
    // fallback default
    return const AssetImage("assets/imgs/user_blue.png");
  }

  /// อัปเดตรูปจากกล้อง/แกลเลอรี
  void updateProfileImage(File newImage) {
    _profileImage = newImage;
    notifyListeners();
  }

  /// ลบรูป (กลับไปใช้ default asset)
  void deleteProfileImage() {
    _profileImage = null;
    _assetImage = "assets/imgs/user_blue.png";
    notifyListeners();
  }

  /// รีเซ็ต asset (ใช้ตอนโหลดข้อมูลจาก OwnerInfo ใหม่)
  void setAssetImage(String assetPath) {
    _assetImage = assetPath;
    _profileImage = null;
    notifyListeners();
  }
}

final profileController = ProfileController(); // global instance
