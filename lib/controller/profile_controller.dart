import 'dart:io';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  File? _profileImage;

  File? get profileImage => _profileImage;

  void updateProfileImage(File? newImage) {
    _profileImage = newImage;
    notifyListeners();
  }
}

// ตัวแปร global
final profileController = ProfileController();
