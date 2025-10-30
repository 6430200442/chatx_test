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
  const JoinChatDropdown({super.key});

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
              selectedValue = value;
            });

            // if (value == 'Join Chat') {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Joined chat!')),
            //   );
            // } else if (value == 'Whisper to Agent') {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (_) => const WhisperPage()),
            //   );
            // }
          },
          buttonStyleData: const ButtonStyleData(
            height: 10,
            padding: EdgeInsets.symmetric(horizontal: 2),
          ),
          // iconStyleData: const IconStyleData(
          //   icon: SizedBox.shrink(), // ไม่แสดงไอคอนเลย
          //   iconSize: 0,
          // ),
          // iconStyleData: const IconStyleData(
          //   icon: Icon(Icons.arrow_drop_down, color: Colors.black),
          //   openMenuIcon: Icon(Icons.arrow_drop_up, color: Colors.black),
          //   iconSize: 20,
          // ),
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
                left: BorderSide(color: Colors.grey,),
                right: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey,),
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
