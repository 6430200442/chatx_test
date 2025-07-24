// import 'package:chatx_test/pages/chat_list.dart';
// import 'package:flutter/material.dart';

// class SplashNativePage extends StatefulWidget {
//   const SplashNativePage({super.key});

//   @override
//   State<SplashNativePage> createState() => _SplashNativePageState();
// }

// class _SplashNativePageState extends State<SplashNativePage> {
//   @override
//   void initState() {
//     super.initState();
    
//     Future.delayed(const Duration(seconds: 10), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => const ChatListPage()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/imgs/rectangleBackground.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Image.asset(
//             'assets/imgs/iconGroup.png', // โลโก้
//             fit: BoxFit.fitWidth,
//           ),
//         ),
//       ),
//     );
//   }
// }
