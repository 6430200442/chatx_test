import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color.fromARGB(255, 14, 80, 223);
  static const Color primaryColor2 = Color.fromARGB(255, 27, 34, 196);
  static const Color secondaryColor = Color.fromARGB(255, 72, 128, 255);
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

class GroupList {
  static const List<String> groups = [
    'All Group',
    'Group XXX',
    'Group YZX',
    'Group XYZ',
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

class TagStatusList {
  static const List<String> tags = [
    'All Tag',
    'no agent',
    'have agent',
    'done',
    'track',
    'refund',
  ];
}

class TagList {
  static const List<String> tags = [
    'All Tags',
    'no agent',
    'have agent',
    'done',
    'tla001',
    'tla002',
    'tla003',
    'tla004',
    'tlb001',
    'tlb002',
    'tlb003',
    'tlb004',
  ];
}

class OwnerInfo {
  static const String ownerName = 'Me';
  static const String ownerImage = 'assets/imgs/agent1.jpg';
}

class AppConstants {
  static const String appName = 'ChatX Login';
  static const double defaultPadding = 40.0;
  static const String backgroundLogin = 'assets/imgs/rectangle.png';
  static const String logoLogin = 'assets/imgs/logoName.png';
}

final Map<String, String> agentImages = {
  'Me': 'assets/imgs/agent1.jpg',
  'Agent Anna': 'assets/imgs/agent2.jpg',
  'Agent Mook': 'assets/imgs/agent3.jpg',
  // เพิ่มตามรายชื่อ agent
};
