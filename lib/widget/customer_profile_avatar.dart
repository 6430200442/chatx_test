import 'package:flutter/material.dart';

class CustomerProfileAvatar extends StatelessWidget {
  final String imagePath;
  const CustomerProfileAvatar({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!, width: 2),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
              backgroundColor: Colors.white,
            ),
          );
  }
}