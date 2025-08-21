// import 'package:flutter/material.dart';

// class MenuButton extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final String routeName;
//   final Color color;

//   const MenuButton({
//     super.key,
//     required this.icon,
//     required this.label,
//     required this.routeName,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.pushReplacementNamed(context, routeName);
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           CircleAvatar(
//             radius: 30,
//             backgroundColor: color,
//             child: Icon(icon, size: 30, color: Colors.white),
//           ),
//           const SizedBox(height: 8),
//           Text(label, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }
// }