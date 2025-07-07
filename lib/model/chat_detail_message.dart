//import 'package:flutter/material.dart';

class ChatDetailMessage {
  final String chatRoomId; 
  final String customerId;
  final String customerImage;
  final String customerName;
  final String messageId; 
  final String message;
  final DateTime time;
  final bool isSender;
  final bool isRead;
  final String status;
  final String channel;
  final String? agentId;
  final String? agentImage;
  final String? agentName;
  //final AgentInfo? agent;

  ChatDetailMessage({
    required this.chatRoomId,
    required this.customerId,
    required this.customerImage,
    required this.customerName,
    required this.messageId,
    required this.message,
    required this.time,
    required this.isSender,
    required this.isRead,
    required this.status,
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
  final String message;
  final String time;

  AgentInfo({
    required this.id,
    required this.name,
    required this.image,
    required this.message,
    required this.time,
  });
}*/
