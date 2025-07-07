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
          .where(
              (chat) => chat.customerName.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  void filter({String? search, String? channel, String? agent, String? status}) {
    filteredChats.value = mockChatData.where((chat) {
      bool matchSearch;
      if (search == null) {
        matchSearch = true;
      } else if (search.isEmpty) {
        matchSearch = true;
      } else if (chat.customerName.toLowerCase().contains(search.toLowerCase())) {
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
      } else if ((chat.agentName!= null && chat.agentName!.toLowerCase() == agent.toLowerCase())) {
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
}
