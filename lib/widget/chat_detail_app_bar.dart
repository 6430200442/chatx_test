import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:chatx_test/model/customer_profile.dart';
import 'package:chatx_test/widget/close_button.dart';
import 'package:chatx_test/widget/join_chat_dropdown.dart';
import 'package:chatx_test/widget/popup_transfer.dart';
import 'package:chatx_test/widget/transfer_button.dart';
import 'package:chatx_test/widget/view_only_button.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/customer_profile.dart';

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatDetailMessage chatDetail;
  final CustomerProfile customerProfile;
  final VoidCallback onClosePressed;
  final VoidCallback onViewOnlyPressed;
  final bool isViewOnly;
  final bool isJoinedChat; // ✅ เพิ่ม
  final Function(String) onJoinChat; // ✅ เพิ่ม callback สำหรับ join

  const ChatDetailAppBar({
    super.key,
    required this.chatDetail,
    required this.customerProfile,
    required this.onClosePressed,
    required this.onViewOnlyPressed,
    required this.isViewOnly,
    required this.isJoinedChat, // ✅ เพิ่ม
    required this.onJoinChat, // ✅ เพิ่ม
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.backButton),
      elevation: 0,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => DraggableScrollableSheet(
                      initialChildSize: 0.7,
                      maxChildSize: 0.85,
                      builder: (context, scrollController) {
                        return CustomerProfilePage(
                          customerHeaderProfile: customerProfile,
                          scrollController: scrollController,
                        );
                      },
                    ),
                  );
                },
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(chatDetail.customerImage),
                      radius: 20,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatDetail.customerName,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(chatDetail.channel),
                              radius: 10,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              chatDetail.channelName,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (chatDetail.status == 'have agent' ||
              chatDetail.status == 'no agent') ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 60,
                    child: CloseButtonLabel(onPressed: onClosePressed),
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    height: 25,
                    width: 80,
                    child: ViewOnlyButton(
                      isViewOnly: isViewOnly,
                      onPressed: onViewOnlyPressed,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                    height: 25,
                    width: 70,
                    child: TransferButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => TransferPopup(
                            agents: AgentList.agentsOnly,
                            onConfirm: (selectedAgent, isPermanent, note,
                                notify, attachSummary) {},
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SizedBox(
                      height: 25,
                      width: 110,
                      child: JoinChatDropdown(
                        onJoin: () {
                          // ✅ เรียก callback แทน setState
                          onJoinChat(OwnerInfo.ownerName);
                        },
                        onWhisper: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const WhisperPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}

// ✅ เพิ่ม WhisperPage ที่หายไป
class WhisperPage extends StatelessWidget {
  const WhisperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Whisper to Agent')),
      body: const Center(child: Text('This is the Whisper Page')),
    );
  }
}