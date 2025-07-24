import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 14, 80, 223);
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color background = Color(0xFFF5F5F5);
  static const Color backButton = Colors.white;
}

class AgentList {
  static const List<String> agents = [
    'All Agents',
    'Me',
    'Agent Anna',
    'Agent Mook',
  ];
}

class ChannelList {
  static const List<String> channels = [
    'All Channel',
    'Facebook',
    'Instagram',
    'Line',
    'WeChat',
    'LiveChat',
  ];
}

class StatusList {
  static const List<String> statuses = [
    'All Status',
    'no agent',
    'have agent',
    'done',
  ];
}

class OwnerInfo {
  static const String ownerName = 'Me';
  static const String ownerImage = 'assets/imgs/agent1.jpg';
}
