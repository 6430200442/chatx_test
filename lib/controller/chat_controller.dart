import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/data/mock_channel_manage.dart';
import 'package:chatx_test/data/mock_customer_contact.dart';
import 'package:chatx_test/data/mock_group_manage.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:chatx_test/model/customer_contact.dart';
import 'package:chatx_test/model/group_manage.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/model/chat_message.dart';
import 'package:chatx_test/data/mock_chat_data.dart';

class ChatController {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<List<ChatMessage>> filteredChats =
      ValueNotifier<List<ChatMessage>>(mockChatData);

  void search(String filter) {
    if (filter.isEmpty) {
      filteredChats.value = mockChatData;
    } else {
      filteredChats.value = mockChatData
          .where((chat) =>
              chat.customerName.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  void filter(
      {String? search, String? channel, String? agent, String? status}) {
    filteredChats.value = mockChatData.where((chat) {
      bool matchSearch;
      if (search == null) {
        matchSearch = true;
      } else if (search.isEmpty) {
        matchSearch = true;
      } else if (chat.customerName
          .toLowerCase()
          .contains(search.toLowerCase())) {
        matchSearch = true;
      } else {
        matchSearch = false;
      }

      bool matchChannel;
      if (channel == null || channel == 'All Channel') {
        matchChannel = true;
      } else if (chat.channel.toLowerCase().contains(channel.toLowerCase())) {
        matchChannel = true;
      } else {
        matchChannel = false;
      }

      bool matchAgent;
      if (agent == null || agent == 'All Agents') {
        matchAgent = true;
      } else if ((chat.agentName != null &&
          chat.agentName!.toLowerCase() == agent.toLowerCase())) {
        matchAgent = true;
      } else {
        matchAgent = false;
      }

      bool matchStatus;
      if (status == null || status == 'All Status') {
        matchStatus = true;
      } else if (chat.status.toLowerCase().contains(status.toLowerCase())) {
        matchStatus = true;
      } else {
        matchStatus = false;
      }

      return matchSearch && matchChannel && matchAgent && matchStatus;
    }).toList();
  }

  void dispose() {
    searchController.dispose();
    filteredChats.dispose();
  }

  void updateStatus(String chatRoomId, String newStatus) {
    final index =
        filteredChats.value.indexWhere((c) => c.chatRoomId == chatRoomId);
    if (index != -1) {
      final old = filteredChats.value[index];
      filteredChats.value[index] = ChatMessage(
        chatRoomId: old.chatRoomId,
        customerId: old.customerId,
        customerImage: old.customerImage,
        customerName: old.customerName,
        lastMessage: old.lastMessage,
        time: old.time,
        unreadCount: old.unreadCount,
        status: newStatus,
        statusColor: _getColorByStatus(newStatus),
        channel: old.channel,
        agentId: old.agentId,
        agentImage: old.agentImage,
        agentName: old.agentName,
      );
      filteredChats.notifyListeners(); // รีเฟรช UI
    }
  }

  Color _getColorByStatus(String status) {
    switch (status) {
      case 'await':
        return Colors.yellow.shade800;
      case 'have agent':
        return Colors.blue;
      case 'done':
        return Colors.black;
      default:
        return Colors.grey;
    }
  }

  void updateTransfer(String chatRoomId, String newAgent) {
    final index =
        filteredChats.value.indexWhere((c) => c.chatRoomId == chatRoomId);
    final image = agentImages[newAgent] ?? 'assets/images/user_blue.png';
    if (index != -1) {
      final old = filteredChats.value[index];
      filteredChats.value[index] = ChatMessage(
        chatRoomId: old.chatRoomId,
        customerId: old.customerId,
        customerImage: old.customerImage,
        customerName: old.customerName,
        lastMessage: old.lastMessage,
        time: old.time,
        unreadCount: old.unreadCount,
        status: old.status,
        statusColor: _getColorByStatus(old.status),
        channel: old.channel,
        agentId: old.agentId,
        // agentImage: old.agentImage,
        agentImage: image,
        agentName: newAgent, // เปลี่ยนตรงนี้
      );
      filteredChats.notifyListeners(); // รีเฟรช UI
    }
  }
}

class CustomerContactController {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<List<CustomerContact>> filteredContacts =
      ValueNotifier<List<CustomerContact>>(mockCustomerContact);

  void filter({String? search, String? channel, String? group, String? tag}) {
    filteredContacts.value = mockCustomerContact.where((customer) {
      final matchSearch = search == null || search.isEmpty
          ? true
          : customer.customerName
                  .toLowerCase()
                  .contains(search.toLowerCase()) ||
              customer.customerNote
                  .toLowerCase()
                  .contains(search.toLowerCase());

      final matchChannel = channel == null || channel == 'All Channel'
          ? true
          : customer.channelName.toLowerCase().contains(channel.toLowerCase());

      final matchGroup = group == null || group == 'All Group'
          ? true
          : customer.groupName.toLowerCase().contains(group.toLowerCase());

      final matchTagStatus = tag == null || tag == 'All Tag'
          ? true
          : (customer.tag?.toLowerCase() == tag.toLowerCase() ||
              customer.status.toLowerCase() == tag.toLowerCase());

      return matchSearch && matchChannel && matchGroup && matchTagStatus;
    }).toList();

    filteredContacts.notifyListeners();
  }

  void dispose() {
    searchController.dispose();
    filteredContacts.dispose();
  }
}

class GroupManageController {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<List<GroupManage>> filteredGroup =
      ValueNotifier<List<GroupManage>>(mockGroupManage);

  void filter({String? search, String? role}) {
    filteredGroup.value = mockGroupManage.where((group) {
      final matchSearch = search == null || search.isEmpty
          ? true
          : group.groupName.toLowerCase().contains(search.toLowerCase());

      final matchRole = role == null || role == 'All Role'
          ? true
          : (group.groupMember?.any(
                (member) => member.role.toLowerCase() == role.toLowerCase(),
              ) ??
              false);

      return matchSearch && matchRole;
    }).toList();

    filteredGroup.notifyListeners();
  }

  void dispose() {
    searchController.dispose();
    filteredGroup.dispose();
  }

  void addGroup(String groupName) {
    final newGroup = GroupManage(
      groupId: DateTime.now().millisecondsSinceEpoch.toString(),
      groupImage: 'https://cdn-icons-png.freepik.com/512/9073/9073405.png',
      groupName: groupName,
      groupMember: [],
    );
    filteredGroup.value = [...filteredGroup.value, newGroup];
    filteredGroup.notifyListeners();
  }

//   void addMember(String memberName) {
//   final newMember = GroupMember(
//     memberId: DateTime.now().millisecondsSinceEpoch.toString(),
//     memberImage: 'https://cdn-icons-png.freepik.com/512/9073/9073405.png',
//     firstName: memberName,
//     lastName: '',
//     role: 'Agent',
//   );
//   filteredGroup.value = [...filteredGroup.value, newMember];
//   filteredGroup.notifyListeners();
// }

  void addMember(String groupId, String memberName) {
    final newMember = GroupMember(
      memberId: DateTime.now().millisecondsSinceEpoch.toString(),
      memberImage: 'https://cdn-icons-png.freepik.com/512/9073/9073405.png',
      firstName: '',
      lastName: '',
      role: 'Agent',
    );

    // หา group ที่จะเพิ่มสมาชิก
    final index = filteredGroup.value.indexWhere((g) => g.groupId == groupId);
    if (index != -1) {
      final group = filteredGroup.value[index];
      final updatedGroup = GroupManage(
        groupId: group.groupId,
        groupImage: group.groupImage,
        groupName: group.groupName,
        groupMember: [...(group.groupMember ?? []), newMember],
      );

      filteredGroup.value = [...filteredGroup.value..[index] = updatedGroup];
      filteredGroup.notifyListeners();
    }
  }

  void deleteGroup(String groupId) {
    filteredGroup.value =
        filteredGroup.value.where((g) => g.groupId != groupId).toList();
    filteredGroup.notifyListeners();
  }

  void deleteMembers(String groupId, List<String> memberIds) {
    final index = filteredGroup.value.indexWhere((g) => g.groupId == groupId);
    if (index != -1) {
      final group = filteredGroup.value[index];
      final updatedGroup = group.copyWith(
        groupMember: group.groupMember
            ?.where((m) => !memberIds.contains(m.memberId))
            .toList(),
      );

      filteredGroup.value = [...filteredGroup.value..[index] = updatedGroup];
      filteredGroup.notifyListeners();
    }
  }

  void deleteAllMembers(String groupId) {
    final index = filteredGroup.value.indexWhere((g) => g.groupId == groupId);
    if (index != -1) {
      final group = filteredGroup.value[index];
      final updatedGroup = group.copyWith(groupMember: []);
      filteredGroup.value = [...filteredGroup.value..[index] = updatedGroup];
      filteredGroup.notifyListeners();
    }
  }
}

class ChannelManageController {
  final TextEditingController searchController = TextEditingController();
  final ValueNotifier<List<ChannelManage>> filteredChannel =
      ValueNotifier<List<ChannelManage>>(mockChannelManage);

  void filter({String? search, String? channel}) {
    filteredChannel.value = mockChannelManage.where((channels) {
      final matchSearch = search == null || search.isEmpty
          ? true
          : channels.groupName.toLowerCase().contains(search.toLowerCase());

      final matchChannel = channel == null || channel == 'All Channel'
          ? true
          : (channels.groupChannel?.any(
                (member) =>
                    member.isConnect && // กรองอันที่ connect แล้ว
                    member.channelName.toLowerCase() == channel.toLowerCase(),
              ) ??
              false);

      return matchSearch && matchChannel;
    }).toList();

    filteredChannel.notifyListeners();
  }

  void dispose() {
    searchController.dispose();
    filteredChannel.dispose();
  }
}
