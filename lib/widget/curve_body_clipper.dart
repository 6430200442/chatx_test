import 'package:flutter/material.dart';

class CurveBodyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // เริ่มจากซ้ายบน
    path.moveTo(0, 25); // จุดเริ่มต้นซ้าย

    // โค้งเว้าลงด้านซ้าย
    path.quadraticBezierTo(
        size.width * 0.015,
        0, // จุดควบคุมโค้งซ้าย
        size.width * 0.10,
        0 // จุดสิ้นสุดโค้งซ้าย
        );

    // เส้นตรงตรงกลาง
    path.lineTo(size.width * 0.90, 0);

    // โค้งเว้าลงด้านขวา
    path.quadraticBezierTo(
        size.width * 0.985,
        0, // จุดควบคุมโค้งขวา
        size.width,
        25 // จุดสิ้นสุดโค้งขวา
        );

    // เส้นด้านขวาลงล่าง
    path.lineTo(size.width, size.height);

    // เส้นด้านล่างไปซ้าย
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
