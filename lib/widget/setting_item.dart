import 'package:flutter/material.dart';

class SettingMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;

  const SettingMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.grey[200], 
            child: Icon(
              icon,
              color: color, 
            ),
          ),
          title: Text(title),
          titleTextStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: color,
          ),
          onTap: onTap,
        ),
        const Divider(height: 1),
      ],
    );
  }
}