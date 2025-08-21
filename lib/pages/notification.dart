// import 'package:chatx_test/constant/app_constants.dart';
// import 'package:flutter/material.dart';
// import 'package:chatx_test/widget/bottom_nav_bar.dart';

// class NotificationPage extends StatefulWidget {
//   const NotificationPage({super.key});

//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }

// class _NotificationPageState extends State<NotificationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: AppColors.primaryColor,
//           titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//           title: const Text('ChatX'),
//         ),
//       body: const Center(child: Text("นี่คือหน้าแจ้งเตือน")),
//       bottomNavigationBar: const BottomNavBar(currentIndex: 2),
//     );
//   }
// }