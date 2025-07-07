import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 254, 105, 110);
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color background = Color(0xFFF5F5F5);
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
