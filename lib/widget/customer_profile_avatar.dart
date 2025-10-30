import 'package:flutter/material.dart';

class CustomerProfileAvatar extends StatelessWidget {
  final String imagePath;
  const CustomerProfileAvatar({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 10),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
              backgroundColor: Colors.white,
            ),
          );
  }
}