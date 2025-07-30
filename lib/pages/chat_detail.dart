import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/data/mock_chat_detail_data.dart';
import 'package:chatx_test/data/mock_customer_profile.dart';
import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:chatx_test/widget/chat_bubble.dart';
import 'package:chatx_test/widget/close_button.dart';
import 'package:chatx_test/widget/tranfer_agent_dropdown.dart';
import 'package:flutter/material.dart';
//import 'package:chatx_test/data/mock_chat_detail_data.dart';
//import 'package:chatx_test/model/chat_message.dart';
import 'package:chatx_test/widget/message_input_bar.dart';
//import 'package:chatx_test/widget/emoji_button.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:chatx_test/pages/customer_profile.dart';

class ChatDetailPage extends StatefulWidget {
  final ChatDetailMessage chatDetail;
  final ChatController chatController;

  const ChatDetailPage({
    Key? key,
    required this.chatDetail,
    required this.chatController,
  }) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  //final FocusNode _focusNode = FocusNode();
  bool _showEmojiBar = false;
  String? selectedTransfer;

  void _handleSend() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    final now = DateTime.now();
    final newMsg = ChatDetailMessage(
      chatRoomId: widget.chatDetail.chatRoomId,
      customerId: widget.chatDetail.customerId,
      customerImage: widget.chatDetail.customerImage,
      customerName: widget.chatDetail.customerName,
      messageId: 'M${DateTime.now().millisecondsSinceEpoch}',
      message: text,
      time: now,
      isSender: true,
      isRead: false,
      status: 'have agent',
      channel: widget.chatDetail.channel,
      agentId: widget.chatDetail.agentId,
      agentImage: OwnerInfo.ownerImage,
      agentName: OwnerInfo.ownerName,
    );
    setState(() {
      mockChatDetailData.add(newMsg);
      _messageController.clear();
    });
  }

  void _toggleEmojiBar() {
    FocusScope.of(context).unfocus();
    setState(() {
      _showEmojiBar = !_showEmojiBar;
    });
  }

  void _onEmojiSelected(String emoji) {
    _messageController.text += emoji;
    _messageController.selection = TextSelection.fromPosition(
      TextPosition(offset: _messageController.text.length),
    );
    setState(() {});
  }

  void onPressedClose() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(' Confirm chat closure '),
          content: const Text('Do you want to complete the task?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog แล้วกลับสู่หน้าปกติ
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                // เปลี่ยนสถานะใน chat list
                setState(() {
                  widget.chatDetail.status = 'done';

                  // หรือถ้าคุณใช้ mock data list ก็ต้องอัปเดตใน mockChatDetailData ด้วย
                  final index = mockChatDetailData.indexWhere(
                      (m) => m.chatRoomId == widget.chatDetail.chatRoomId);
                  if (index != -1) {
                    mockChatDetailData[index] =
                        mockChatDetailData[index].copyWith(status: 'done');
                  }

                  widget.chatController.updateStatus(
                      widget.chatDetail.chatRoomId,
                      'done'); // ✅ อัปเดตที่ ChatList
                });

                Navigator.of(context).pop(); // ปิด dialog
                Navigator.of(context).pop(); // กลับไปหน้า ChatList
              },
            ),
          ],
        );
      },
    );
  }

  void onPressedTransfer() {
    if (selectedTransfer == null) return; // ป้องกันถ้ายังไม่เลือก agent

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm chat transfer'),
          content: Text('Do you want to transfer the chat to $selectedTransfer ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // ปิด dialog
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                setState(() {
                  // ✅ อัปเดตในหน้า ChatDetail
                  widget.chatDetail.agentName = selectedTransfer;

                  // ✅ อัปเดตใน mockChatDetailData
                  final index = mockChatDetailData.indexWhere(
                      (m) => m.chatRoomId == widget.chatDetail.chatRoomId);
                  if (index != -1) {
                    mockChatDetailData[index] = mockChatDetailData[index]
                        .copyWith(agentName: selectedTransfer);
                  }

                  // ✅ เรียก controller เพื่อ sync กลับไปหน้า ChatList
                  widget.chatController.updateTransfer(
                      widget.chatDetail.chatRoomId, selectedTransfer!);
                });

                Navigator.of(context).pop(); // ปิด dialog
                Navigator.of(context).pop(); // กลับไปหน้า ChatList
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages = mockChatDetailData
        .where((m) => m.chatRoomId == widget.chatDetail.chatRoomId)
        .toList()
      ..sort((a, b) => a.time.compareTo(b.time));

    final customerProfile = mockCustomer.firstWhere(
      (c) => c.customerId == widget.chatDetail.customerId,
      orElse: () => throw Exception('Customer not found'),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.backButton),
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => DraggableScrollableSheet(
                  initialChildSize: 0.7,
                  minChildSize: 0.1,
                  maxChildSize: 0.85,
                  expand: false,
                  builder: (context, scrollController) {
                    return CustomerProfilePage(
                        customerHeaderProfile: customerProfile,
                        scrollController: scrollController);
                  }),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.chatDetail.customerImage),
                radius: 18,
              ),
              const SizedBox(width: 12),
              Text(widget.chatDetail.customerName),
            ],
          ),
        ),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.normal,
            ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              color: Colors.white,
              child: Row(
                children: [
                  CloseButtonLabel(onPressed: onPressedClose),
                  const SizedBox(width: 10),
                  TransferDropdown(
                    transfer: AgentList.agents,
                    selectedTransfer: selectedTransfer,
                    onChanged: (value) {
                      setState(() {
                        selectedTransfer = value!;
                      });
                      onPressedTransfer();
                    },
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final bool showAvatarAndName = index == 0 ||
                      msg.isSender != messages[index - 1].isSender;
                  return ChatBubble(
                    message: msg.message,
                    isSender: msg.isSender,
                    time: msg.time,
                    senderName:
                        msg.isSender ? (msg.agentName ?? '') : msg.customerName,
                    senderImage: msg.isSender
                        ? (msg.agentImage ?? '')
                        : msg.customerImage,
                    showAvatarAndName: showAvatarAndName,
                  );
                },
                separatorBuilder: (context, index) {
                  final isDiffSender =
                      messages[index].isSender != messages[index + 1].isSender;
                  return SizedBox(height: isDiffSender ? 10 : 3);
                },
              ),
            ),

            // Emoji Picker
            if (_showEmojiBar)
              SizedBox(
                height: 300,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) {
                    _onEmojiSelected(emoji.emoji);
                  },
                ),
              ),
            MessageInputBar(
              controller: _messageController,
              onSend: _handleSend,
              onEmojiPressed: _toggleEmojiBar, // เปลี่ยนจาก _showEmojiPicker
            ),
          ],
        ),
      ),
    );
  }
}
