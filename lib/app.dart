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
