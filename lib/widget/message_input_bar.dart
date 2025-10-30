import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'quick_reply_label.dart';
import 'emoji_button.dart';
import 'canned_dropdown.dart';
import 'quick_reply_dropdown.dart';

class MessageInputBar extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onEmojiPressed;
  final VoidCallback onQuickReplyToggle;
  final bool showQuickReplies;
  final List<String> quickReplies;
  final Function(String) onQuickReplyTap;
  final Function(String filePath)? onFilePicked;
  final Function(String imagePath)? onImagePicked;

  const MessageInputBar({
    Key? key,
    required this.controller,
    required this.onSend,
    required this.onEmojiPressed,
    required this.onQuickReplyToggle,
    required this.showQuickReplies,
    required this.quickReplies,
    required this.onQuickReplyTap,
    this.onFilePicked,
    this.onImagePicked,
  }) : super(key: key);

  @override
  State<MessageInputBar> createState() => _MessageInputBarState();
}

class _MessageInputBarState extends State<MessageInputBar> {
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      widget.onFilePicked?.call(result.files.single.path!);
    }
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      widget.onImagePicked?.call(pickedImage.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            TextField(
              controller: widget.controller,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Type a message',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                border: InputBorder.none,
              ),
            ),
            if (widget.showQuickReplies)
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 8),
                child: QuickReplyRow(
                  replies: widget.quickReplies,
                  onTap: widget.onQuickReplyTap,
                ),
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 📄 เลือกไฟล์
                IconButton(
                  icon: const Icon(Icons.file_present_outlined),
                  onPressed: _pickFile,
                  color: Colors.grey,
                  iconSize: 20,
                ),

                EmojiButton(onPressed: widget.onEmojiPressed),

                // 🖼️ เลือกรูป
                IconButton(
                  icon: const Icon(Icons.image_outlined),
                  onPressed: _pickImage,
                  color: Colors.grey,
                  iconSize: 20,
                ),

                IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: widget.onQuickReplyToggle,
                  color: Colors.grey,
                  iconSize: 20,
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 6, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 14, 80, 223),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: InkWell(
                      onTap: widget.onSend,
                      child: const Row(
                        children: [
                          Text('Send',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14)),
                          SizedBox(width: 4),
                          Icon(Icons.send,
                              color: Colors.white, size: 18),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ✅ แถบล่าง: canned + quick reply
            Container(
              height: 40,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 25, width: 150, child: CannedDropdown()),
                    SizedBox(width: 8),
                    SizedBox(height: 25, width: 150, child: QuickReplyDropdown()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
