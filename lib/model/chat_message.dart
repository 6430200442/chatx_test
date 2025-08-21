import 'package:flutter/material.dart';

class CustomerProfile {
  final String chatRoomId; // Unique identifier for each chat message
  final String customerId;
  final String customerImage;
  final String customerName;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final String status;
  final Color statusColor;
  final String channel;
  final String? agentId;
  final String? agentImage;
  final String? agentName;
  
  //final AgentInfo? agent;

  CustomerProfile({
    required this.chatRoomId,
    required this.customerId,
    required this.customerImage,
    required this.customerName,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
    required this.status,
    required this.statusColor,
    required this.channel,
    this.agentId,
    this.agentImage,
    this.agentName,
    //this.agent,
  });
}

/*class AgentInfo {
  final String id;
  final String name;
  final String image;

  AgentInfo({
    required this.id,
    required this.name,
    required this.image,
  });
}*/
