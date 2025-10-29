import 'package:chatx_test/constant/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/login.dart';
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
          seedColor: AppColors.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// หน้าหลักหลังล็อกอิน
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;

  final List<Widget> pages = const [
    ChatListPage(),
    CustomerContactPage(),
    GroupManagePage(),
    ChannelManagePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: AppColors.primaryColor,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.chat, color: Colors.white),
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.perm_contact_cal_rounded, color: Colors.white),
            icon: Icon(Icons.perm_contact_cal_rounded),
            label: 'Contact',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.groups, color: Colors.white),
            icon: Icon(Icons.groups),
            label: 'Group',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.language, color: Colors.white),
            icon: Icon(Icons.language),
            label: 'Channel',
          ),
        ],
      ),
    );
  }
}
