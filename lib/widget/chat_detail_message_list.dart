import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:chatx_test/widget/chat_bubble.dart';
import 'package:flutter/material.dart';

class ChatDetailMessageList extends StatelessWidget {
  final List<ChatDetailMessage> messages;

  const ChatDetailMessageList({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        final showAvatarAndName =
            index == 0 || msg.isSender != messages[index - 1].isSender;

        return ChatBubble(
          message: msg.message,
          isSender: msg.isSender,
          time: msg.time,
          senderName:
              msg.isSender ? (msg.agentName ?? '') : msg.customerName,
          senderImage:
              msg.isSender ? (msg.agentImage ?? '') : msg.customerImage,
          showAvatarAndName: showAvatarAndName,
        );
      },
      separatorBuilder: (context, index) {
        final isDiffSender =
            messages[index].isSender != messages[index + 1].isSender;
        return SizedBox(height: isDiffSender ? 10 : 3);
      },
    );
  }
}
