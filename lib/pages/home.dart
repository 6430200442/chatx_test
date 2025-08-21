// import 'package:chatx_test/constant/app_constants.dart';
// import 'package:chatx_test/widget/bottom_nav_bar.dart';
// // import 'package:chatx_test/widget/menu_button.dart';
// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
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
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         // child: GridView.count(
//         //   crossAxisCount: 3, // แถวละ 3 เมนู
//         //   mainAxisSpacing: 20,
//         //   crossAxisSpacing: 20,
//         //   children: const [
//         //     MenuButton(
//         //       icon: Icons.perm_contact_calendar_rounded,
//         //       label: "รายชื่อ",
//         //       routeName: "/customer",
//         //       color: Colors.blue,
//         //     ),
//         //     MenuButton(
//         //       icon: Icons.group,
//         //       label: "กรุ๊ป",
//         //       routeName: "/group",
//         //       color: Colors.green,
//         //     ),
//         //     MenuButton(
//         //       icon: Icons.chat,
//         //       label: "แชแนล",
//         //       routeName: "/channel",
//         //       color: Colors.orange,
//         //     ),
//         //   ],
//         // ),
//       ),
//       bottomNavigationBar: const BottomNavBar(currentIndex: 0),
//     );
//   }
// }