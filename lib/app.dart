//import 'package:chatx_test/pages/chat_list.dart';
// import 'package:chatx_test/pages/splash_native.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/chat_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatX',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChatListPage(),
    );
  }
}
