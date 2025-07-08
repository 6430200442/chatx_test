import 'package:chatx_test/data/mock_chat_detail_data.dart';
import 'package:chatx_test/model/chat_message.dart';
import 'package:chatx_test/pages/chat_detail.dart';
import 'package:flutter/material.dart';
//import 'package:chatx_test/app.dart';
//import 'package:chatx_test/pages/chat_list.dart';
import 'package:chatx_test/widget/search_box.dart';
import 'package:chatx_test/widget/channel_dropdown.dart';
import 'package:chatx_test/widget/agent_dropdown.dart';
import 'package:chatx_test/widget/chat_item.dart';
//import 'package:chatx_test/data/mock_chat_data.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/widget/status_dropdown.dart';
import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/filter_dialog.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  late final ChatController chatController;
  String? selectedChannel = 'All Channel';
  String? selectedAgent = 'All Agents';
  String? selectedStatus = 'All Status';
  bool _showFilterBar = false;

  @override
  void initState() {
    super.initState();
    chatController = ChatController();
  }

  void filterChats() {
    chatController.filter(
        search: chatController.searchController.text,
        channel: selectedChannel,
        agent: selectedAgent,
        status: selectedStatus);
  }

  void _showFilterDialog() async {
    final result = await showDialog<Map<String, String?>>(
      context: context,
      builder: (context) => FilterDialog(
        selectedChannel: selectedChannel,
        selectedAgent: selectedAgent,
        selectedStatus: selectedStatus,
      ),
    );
    if (result != null) {
      setState(() {
        selectedChannel = result['channel'];
        selectedAgent = result['agent'];
        selectedStatus = result['status'];
        filterChats();
      });
    }
  }

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
          title: const Text('Chat X'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 6.0),
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: SearchBox(
                      controller: chatController.searchController,
                      onSearch: () {
                        filterChats();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      setState(() {
                        _showFilterBar = !_showFilterBar;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (_showFilterBar)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ChannelDropdown(
                        channels: ChannelList.channels,
                        selectedChannel: selectedChannel,
                        onChanged: (value) {
                          setState(() {
                            selectedChannel = value;
                            filterChats();
                          });
                        },
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AgentDropdown(
                        agents: AgentList.agents,
                        selectedAgent: selectedAgent,
                        onChanged: (value) {
                          setState(() {
                            selectedAgent = value;
                            filterChats();
                          });
                        },
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: StatusDropdown(
                        statuses: StatusList.statuses,
                        selectedStatus: selectedStatus,
                        onChanged: (value) {
                          setState(() {
                            selectedStatus = value;
                            filterChats();
                          });
                        },
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 2.0),
            Expanded(
              child: ValueListenableBuilder<List<ChatMessage>>(
                valueListenable: chatController.filteredChats,
                builder: (context, filteredList, _) {
                  return ListView.builder(
                    itemCount: filteredList.length,
                    itemBuilder: (context, index) {
                      final chat = filteredList[index];

                      // หา ChatDetailMessage ที่ตรงกับ id ของ ChatMessage
                      final chatDetail = mockChatDetailData.firstWhere(
                        (d) => d.customerId == chat.customerId,
                        orElse: () =>
                            mockChatDetailData.first, // fallback ถ้าไม่เจอ
                      );
                      // สร้าง ChatItem และส่ง chatDetail ไปยัง ChatDetailPage
                      return ChatItem(
                        chatMessage: chat,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatDetailPage(
                                chatDetail: chatDetail,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ));
  }
}
