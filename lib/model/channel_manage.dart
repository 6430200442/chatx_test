// import 'package:flutter/material.dart';

class ChannelManage { 
  final String groupId;
  final String groupImage;
  final String groupName;
  final List<GroupChannel>? groupChannel;

  ChannelManage ({
    required this.groupId,
    required this.groupImage,
    required this.groupName,
    this.groupChannel,
    
  });

  // copyWith method สำหรับ immutable pattern
  ChannelManage copyWith({
    String? groupId,
    String? groupName,
    String? groupImage,
    List<GroupChannel>? groupChannel,
  }) {
    return ChannelManage(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      groupImage: groupImage ?? this.groupImage,
      groupChannel: groupChannel ?? this.groupChannel,
    );
  }

}

class GroupChannel {
  final String channelId;
  final String channelName;
  final String channelImage;
  final bool isConnect;
  final bool isOpen;

  GroupChannel({
    required this.channelId,
    required this.channelName,
    required this.channelImage,
    required this.isConnect,
    required this.isOpen,
  });

  GroupChannel copyWith({
    String? channelId,
    String? channelName,
    String? channelImage,
    bool? isConnect,
    bool? isOpen,
  }) {
    return GroupChannel(
      channelId: channelId ?? this.channelId,
      channelName: channelName ?? this.channelName,
      channelImage: channelImage ?? this.channelImage,
      isConnect: isConnect ?? this.isConnect,
      isOpen: isOpen ?? this.isOpen,
    );
  }
}

