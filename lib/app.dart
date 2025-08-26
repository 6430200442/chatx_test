//import 'package:chatx_test/pages/chat_list.dart';
// import 'package:chatx_test/pages/splash_native.dart';
// import 'package:chatx_test/pages/login.dart';
import 'package:chatx_test/pages/channel_manage.dart';
import 'package:chatx_test/pages/customer_contact.dart';
import 'package:chatx_test/pages/group_manage.dart';
// import 'package:chatx_test/pages/home.dart';
// import 'package:chatx_test/pages/notification.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/chat_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(
              255, 14, 80, 223), // สีหลักสำหรับธีม Material 3
        ).copyWith(
          surface: Colors.white, //เปลี่ยนเฉพาะ background เป็นขาว
        ),
        useMaterial3: true,
      ),
      initialRoute: '/chat',
      routes: {
        // '/home': (context) => const HomePage(),
        // '/notification': (context) => const NotificationPage(),
        '/chat': (context) => const ChatListPage(),
        '/customer': (context) => const CustomerContactPage(),
        '/group': (context) => const GroupManagePage(),
        '/channel': (context) => const ChannelManagePage(),
      },

      // home: const LoginPage(),
      // home: const ChatListPage(),
    );
  }
}
