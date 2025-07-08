import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/data/mock_chat_detail_data.dart';
import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:chatx_test/widget/chat_bubble.dart';
import 'package:flutter/material.dart';
//import 'package:chatx_test/data/mock_chat_detail_data.dart';
//import 'package:chatx_test/model/chat_message.dart';
import 'package:chatx_test/widget/message_input_bar.dart';
//import 'package:chatx_test/widget/emoji_button.dart';
//import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatDetailPage extends StatefulWidget {
  final ChatDetailMessage chatDetail;

  const ChatDetailPage({Key? key, required this.chatDetail}) : super(key: key);

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  //final FocusNode _focusNode = FocusNode();
  bool _showEmojiBar = false;

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

  @override
  Widget build(BuildContext context) {
    final messages = mockChatDetailData
        .where((m) => m.chatRoomId == widget.chatDetail.chatRoomId)
        .toList()
      ..sort((a, b) => a.time.compareTo(b.time));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.chatDetail.customerImage),
              radius: 18,
            ),
            const SizedBox(width: 12),
            Text(widget.chatDetail.customerName),
          ],
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
