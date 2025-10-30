import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class WhisperPopup extends StatefulWidget {
  final List<String> agents;
  final void Function(String selectedAgent, String message) onConfirm;

  const WhisperPopup({
    super.key,
    required this.agents,
    required this.onConfirm,
  });

  @override
  State<WhisperPopup> createState() => _WhisperPopupState();
}

class _WhisperPopupState extends State<WhisperPopup> {
  String? selectedAgent;
  final TextEditingController messageController = TextEditingController();
  int messageLength = 0;
  static const int maxMessageLength = 100;

  void _updateMessage(String value) {
    if (value.length > maxMessageLength) {
      messageController.text = value.substring(0, maxMessageLength);
      messageController.selection = TextSelection.fromPosition(
          TextPosition(offset: messageController.text.length));
    }
    setState(() {
      messageLength = messageController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // หัวข้อหลัก
              const Text(
                "Whisper to Agent",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Select Agent
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Agent",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Icon(Icons.support_agent, color: Colors.grey, size: 18),
                        SizedBox(width: 8),
                        Text("Select Agent"),
                      ],
                    ),
                    value: selectedAgent,
                    items: widget.agents
                        .map((agent) => DropdownMenuItem<String>(
                              value: agent,
                              child: Row(
                                children: [
                                  const Icon(Icons.support_agent,
                                      color: Colors.grey, size: 18),
                                  const SizedBox(width: 8),
                                  Text(agent,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedAgent = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        border: Border(
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          top: BorderSide.none,
                        ),
                      ),
                      elevation: 0,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      overlayColor: WidgetStatePropertyAll(Colors.grey),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Whisper Message
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Whisper Message",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  TextField(
                    controller: messageController,
                    maxLines: 3,
                    onChanged: _updateMessage,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 8,
                    child: Text(
                      "$messageLength/$maxMessageLength",
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: selectedAgent != null && messageLength > 0
                          ? () {
                              Navigator.pop(context);
                              widget.onConfirm(
                                  selectedAgent!, messageController.text);
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        "Confirm",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
