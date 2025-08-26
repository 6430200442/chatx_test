// import 'package:flutter/material.dart';

class GroupManage { 
  final String groupId;
  final String groupImage;
  final String groupName;
  final List<GroupMember>? groupMember;

  GroupManage ({
    required this.groupId,
    required this.groupImage,
    required this.groupName,
    this.groupMember,
    
  });
}

class GroupMember {
  final String memberId;
  final String memberImage;
  final String firstName;
  final String lastName;
  final String role;

  GroupMember({
    required this.memberId,
    required this.memberImage,
    required this.firstName,
    required this.lastName,
    required this.role,
  });
}