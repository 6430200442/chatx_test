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
  String status;
  final String channel;
  final String channelName;
  final String? agentId;
  final String? agentImage;
  String? agentName;
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
    required this.channelName,
    this.agentId,
    this.agentImage,
    this.agentName,
    //this.agent,
  });

  ChatDetailMessage copyWith({
  String? chatRoomId,
  String? customerId,
  String? customerImage,
  String? customerName,
  String? messageId,
  String? message,
  DateTime? time,
  bool? isSender,
  bool? isRead,
  String? status,
  String? channel,
  String? channelName,
  String? agentId,
  String? agentImage,
  String? agentName,
}) {
  return ChatDetailMessage(
    chatRoomId: chatRoomId ?? this.chatRoomId,
    customerId: customerId ?? this.customerId,
    customerImage: customerImage ?? this.customerImage,
    customerName: customerName ?? this.customerName,
    messageId: messageId ?? this.messageId,
    message: message ?? this.message,
    time: time ?? this.time,
    isSender: isSender ?? this.isSender,
    isRead: isRead ?? this.isRead,
    status: status ?? this.status,
    channel: channel ?? this.channel,
    channelName: channelName ?? this.channelName,
    agentId: agentId ?? this.agentId,
    agentImage: agentImage ?? this.agentImage,
    agentName: agentName ?? this.agentName,
  );
}

}

