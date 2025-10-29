// import 'package:flutter/material.dart';

// class ChannelDropdown extends StatelessWidget {
//   final List<String> channels;
//   final String? selectedChannel;
//   final ValueChanged<String?>? onChanged;
//   final BorderRadius borderRadius;

//   const ChannelDropdown({
//     super.key,
//     required this.channels,
//     this.selectedChannel,
//     this.onChanged,
//     required this.borderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       // height: 50,
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: Colors.white,
//         border: Border.all(color: Colors.white),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton<String>(
//           value: selectedChannel,
//           hint: const Text('Select Channel'),
//           style: TextStyle(color: Colors.grey.shade600),
//           isExpanded: true,
//           items: channels.map((String channel) {
//             return DropdownMenuItem<String>(
//               value: channel,
//               child: Text(channel),
//             );
//           }).toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

// class ChannelDropdown extends StatelessWidget {
//   final List<String> channels;
//   final String? selectedChannel;
//   final ValueChanged<String?>? onChanged;
//   final BorderRadius borderRadius;

//   const ChannelDropdown({
//     super.key,
//     required this.channels,
//     this.selectedChannel,
//     this.onChanged,
//     required this.borderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.0),
//         color: Colors.white,
//         border: Border.all(color: Colors.white),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//           isExpanded: true,
//           value: selectedChannel,
//           hint: const Text('Select Channel'),
//           items: channels.map((String channel) {
//             return DropdownMenuItem<String>(
//               value: channel,
//               child: Text(channel),
//             );
//           }).toList(),
//           onChanged: onChanged,

//           // ✅ ปรับขอบเมนูให้ตรงกับ dropdown
//           dropdownStyleData: DropdownStyleData(
//             width: MediaQuery.of(context).size.width - 32, // ชดเชย padding
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(25),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.15),
//                   spreadRadius: 1,
//                   blurRadius: 5,
//                   offset: const Offset(0, 3),
//                 ),
//               ],
//             ),
//             offset: const Offset(0, 0),
//           ),

//           buttonStyleData: const ButtonStyleData(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             height: 50,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ChannelDropdown extends StatelessWidget {
  final List<String> channels;
  final String? selectedChannel;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const ChannelDropdown({
    super.key,
    required this.channels,
    this.selectedChannel,
    this.onChanged,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: selectedChannel,
          items: channels.map((String channel) {
            return DropdownMenuItem<String>(
              value: channel,
              child: Row(
                children: [
                  const Icon(Icons.language, color: Colors.grey, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    channel,
                    style: const TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,

          // 🎨 ปรับสไตล์ของ dropdown button
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),

          // 📋 ปรับสไตล์ของเมนู
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200, // แสดงได้สูงสุดประมาณ 4 item (scroll ได้)
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              border: Border(
                left: BorderSide(color: Colors.grey,),
                right: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey,),
                top: BorderSide.none, // ไม่มีขอบบน
              ),
            ),
            elevation: 0,
          ),

          // แถบสีเทาเมื่อ hover / กด
          menuItemStyleData: const MenuItemStyleData(
            overlayColor: WidgetStatePropertyAll(Colors.grey),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ),
    );
  }
}
