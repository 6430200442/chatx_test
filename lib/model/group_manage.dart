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

  // copyWith method สำหรับ immutable pattern
  GroupManage copyWith({
    String? groupId,
    String? groupName,
    String? groupImage,
    List<GroupMember>? groupMember,
  }) {
    return GroupManage(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      groupImage: groupImage ?? this.groupImage,
      groupMember: groupMember ?? this.groupMember,
    );
  }

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

  GroupMember copyWith({
    String? memberId,
    String? firstName,
    String? lastName,
    String? memberImage,
    String? role,
  }) {
    return GroupMember(
      memberId: memberId ?? this.memberId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      memberImage: memberImage ?? this.memberImage,
      role: role ?? this.role,
    );
  }
}

