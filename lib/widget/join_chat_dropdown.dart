import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/popup_whisper.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

// หน้าจอ mock สำหรับ Whisper Page
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

class JoinChatDropdown extends StatefulWidget {
  final VoidCallback onJoin;
  final VoidCallback onWhisper;

  const JoinChatDropdown(
      {super.key, required this.onJoin, required this.onWhisper});

  @override
  State<JoinChatDropdown> createState() => _JoinChatDropdownState();
}

class _JoinChatDropdownState extends State<JoinChatDropdown> {
  final List<String> items = [
    'Join Chat',
    'Whisper to Agent',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.chat, size: 16, color: Colors.black),
              SizedBox(width: 4),
              Text(
                'Join Chat',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          value: selectedValue,
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              // selectedValue = value;
            });

            if (value == 'Join Chat') {
              widget.onJoin();
            } else if (value == 'Whisper to Agent') {
              showDialog(
                context: context,
                builder: (_) => WhisperPopup(
                  agents: AgentList.agentsOnly,
                  onConfirm: (agent, message) {
                  },
                ),
              );
            }
          },
          buttonStyleData: const ButtonStyleData(
            height: 10,
            padding: EdgeInsets.symmetric(horizontal: 2),
          ),
          dropdownStyleData: const DropdownStyleData(
            width: 110,
            maxHeight: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ), // โค้งเฉพาะขอบล่าง
              border: Border(
                left: BorderSide(
                  color: Colors.grey,
                ),
                right: BorderSide(color: Colors.grey),
                bottom: BorderSide(
                  color: Colors.grey,
                ),
                top: BorderSide.none, // ไม่มีขอบบน
              ),
            ),
            elevation: 0,
            offset: const Offset(0, -1),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 20,
            overlayColor: WidgetStatePropertyAll(Colors.grey),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
          ),
        ),
      ),
    );
  }
}
