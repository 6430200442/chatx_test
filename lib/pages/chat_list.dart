import 'package:chatx_test/controller/profile_controller.dart';
import 'package:chatx_test/data/mock_chat_detail_data.dart';
import 'package:chatx_test/model/chat_message.dart';
import 'package:chatx_test/pages/chat_detail.dart';
import 'package:chatx_test/pages/setting.dart';
import 'package:chatx_test/pages/user_profile.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/widget/search_box.dart';
import 'package:chatx_test/widget/channel_dropdown.dart';
import 'package:chatx_test/widget/agent_dropdown.dart';
import 'package:chatx_test/widget/chat_item.dart';
//import 'package:chatx_test/data/mock_chat_data.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/widget/status_dropdown.dart';
import 'package:chatx_test/constant/app_constants.dart';
// import 'package:chatx_test/widget/bottom_nav_bar.dart';

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

  @override
  void dispose() {
    chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        titleSpacing: 0, // ให้ชิดขอบซ้ายสุด
        title: Stack(
          alignment: Alignment.center,
          children: [
            // 👤 รูปโปรไฟล์ (ซ้าย)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfilePage(),
                      ),
                    );
                  },
                  child: AnimatedBuilder(
                    animation: profileController,
                    builder: (context, _) => CircleAvatar(
                      radius: 14,
                      backgroundImage: profileController.currentImage,
                    ),
                  ),
                ),
              ),
            ),

            // 📄 ชื่อหน้า (ตรงกลางจริง)
            const Center(
              child: Text(
                'ChatX',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            // 🔔 กับ ⚙️ (ขวาสุดจริง)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                      color: Colors.white,
                      iconSize: 22,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.settings),
                      color: Colors.white,
                      iconSize: 22,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Flexible(
                      child: SearchBox(
                        controller: chatController.searchController,
                        onSearch: () {
                          filterChats();
                        },
                        onFilter: () {
                          setState(() {
                            _showFilterBar = !_showFilterBar;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              if (_showFilterBar)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  child: Column(
                    children: [
                      ChannelDropdown(
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
                      const SizedBox(height: 8),
                      AgentDropdown(
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
                      const SizedBox(height: 8),
                      StatusDropdown(
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
                                  chatController:
                                      chatController, // <--- ส่ง controller
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
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
