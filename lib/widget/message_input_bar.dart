// import 'package:chatx_test/model/quick_reply_message.dart';
import 'package:flutter/material.dart';
import 'emoji_button.dart';
import 'quick_reply_label.dart';

class MessageInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onEmojiPressed;
  final VoidCallback onQuickReplyToggle;
  final bool showQuickReplies;
  final List<String> quickReplies;
  final Function(String) onQuickReplyTap;

  const MessageInputBar({
    Key? key,
    required this.controller,
    required this.onSend,
    required this.onEmojiPressed,
    required this.onQuickReplyToggle,
    required this.showQuickReplies,
    required this.quickReplies,
    required this.onQuickReplyTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(2),
        ),
        child: Column(
          children: [
            // TextField สูงขึ้นและไม่มีเส้นกรอบ
            // mainAxisSize: MainAxisSize.min,
            TextField(
              controller: controller,
              minLines: 2, // ความสูงเริ่มต้น
              maxLines: 5, // พิมพ์หลายบรรทัดได้
              decoration: const InputDecoration(
                hintText: 'Type a message',
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: InputBorder.none, // ไม่มีกรอบ
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),

            if (showQuickReplies)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                child: QuickReplyRow(
                  replies: quickReplies,
                  onTap: onQuickReplyTap,
                ),
              ),

            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.file_present_outlined),
                  onPressed: onSend,
                  color: Colors.grey,
                ),
                EmojiButton(onPressed: onEmojiPressed),
                IconButton(
                  icon: const Icon(Icons.image_outlined),
                  onPressed: onSend,
                  color: Colors.grey,
                ),
                IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: onQuickReplyToggle, // <-- Toggle Quick Reply
                  color: Colors.grey,
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 14, 80, 223),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    onTap: onSend,
                    child: const Row(
                      children: [
                        Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.send, color: Colors.white, size: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
