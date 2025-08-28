// //import 'package:chatx_test/pages/chat_list.dart';
// // import 'package:chatx_test/pages/splash_native.dart';
// // import 'package:chatx_test/pages/login.dart';
// import 'package:chatx_test/pages/channel_manage.dart';
// import 'package:chatx_test/pages/customer_contact.dart';
// import 'package:chatx_test/pages/group_manage.dart';
// // import 'package:chatx_test/pages/home.dart';
// // import 'package:chatx_test/pages/notification.dart';
// import 'package:flutter/material.dart';
// import 'package:chatx_test/pages/chat_list.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ChatX',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color.fromARGB(
//               255, 14, 80, 223), // สีหลักสำหรับธีม Material 3
//         ).copyWith(
//           surface: Colors.white, //เปลี่ยนเฉพาะ background เป็นขาว
//         ),
//         useMaterial3: true,
//       ),
//       initialRoute: '/chat',
//       routes: {
//         // '/home': (context) => const HomePage(),
//         // '/notification': (context) => const NotificationPage(),
//         '/chat': (context) => const ChatListPage(),
//         '/customer': (context) => const CustomerContactPage(),
//         '/group': (context) => const GroupManagePage(),
//         '/channel': (context) => const ChannelManagePage(),
//       },

//       // home: const LoginPage(),
//       // home: const ChatListPage(),
//     );
//   }
// }

import 'package:chatx_test/widget/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/chat_list.dart';
import 'package:chatx_test/pages/customer_contact.dart';
import 'package:chatx_test/pages/group_manage.dart';
import 'package:chatx_test/pages/channel_manage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 14, 80, 223),
        ).copyWith(surface: Colors.white),
        useMaterial3: true,
      ),
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final pages = const [
    ChatListPage(),
    CustomerContactPage(),
    GroupManagePage(),
    ChannelManagePage(),
  ];

  // void onItemTap(int index) {
  //   if (currentIndex == index) return;
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onItemTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
