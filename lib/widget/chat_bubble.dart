// import 'package:chatx_test/constant/app_constants.dart';
// import 'package:flutter/material.dart';

// class ChatBubble extends StatelessWidget {
//   final String message;
//   final bool isSender;
//   final DateTime time;
//   final String senderImage;
//   final String senderName;
//   final bool showAvatarAndName;

//   const ChatBubble({
//     super.key,
//     required this.message,
//     required this.isSender,
//     required this.time,
//     required this.senderImage,
//     required this.senderName,
//     this.showAvatarAndName = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final timeString =
//         "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
//     return Column(
//       crossAxisAlignment:
//           isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment:
//               isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//           children: [
//             if (showAvatarAndName && !isSender) ...[
//               CircleAvatar(
//                 radius: 14,
//                 backgroundImage: AssetImage(senderImage),
//               ),
//               const SizedBox(width: 4),
//               Text(senderName),
//             ],
//             if (showAvatarAndName && isSender) ...[
//               Text(senderName),
//               const SizedBox(width: 4),
//               CircleAvatar(
//                 radius: 14,
//                 backgroundImage: AssetImage(senderImage),
//               ),
//             ],
//           ],
//         ),
//         Row(
//           mainAxisAlignment:
//               isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
//           children: [
//             if (isSender)
//               Padding(
//                 padding: const EdgeInsets.only(right: 4.0, top: 20.0),
//                 child: Text(
//                   timeString,
//                   style: const TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//               ),
//             Flexible(
//                 child: ConstrainedBox(
//               constraints: BoxConstraints(
//                 maxWidth: MediaQuery.of(context).size.width * 0.7,
//               ),
//               child: Container(
//                 margin: const EdgeInsets.symmetric(vertical: 4),
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: isSender ? AppColors.primaryColor : Colors.grey[200],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text(message),
//               ),
//             )),
//             if (!isSender)
//               Padding(
//                 padding: const EdgeInsets.only(left: 4.0, top: 20.0), //ล่าสุด
//                 child: Text(
//                   timeString,
//                   style: const TextStyle(fontSize: 10, color: Colors.grey),
//                 ),
//               ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:chatx_test/constant/app_constants.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isSender;
  final DateTime time;
  final String senderImage;
  final String senderName;
  final bool showAvatarAndName;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isSender,
    required this.time,
    required this.senderImage,
    required this.senderName,
    this.showAvatarAndName = true,
  });

  @override
  Widget build(BuildContext context) {
    final timeString =
        "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";

    return Column(
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        // 🔹 ชื่อ + รูปโปรไฟล์
        Row(
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (showAvatarAndName && !isSender) ...[
              CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage(senderImage),
              ),
              const SizedBox(width: 4),
              Text(senderName),
            ],
            if (showAvatarAndName && isSender) ...[
              Text(senderName),
              const SizedBox(width: 4),
              CircleAvatar(
                radius: 14,
                backgroundImage: AssetImage(senderImage),
              ),
            ],
          ],
        ),

        // 🔹 กล่องข้อความ
        Row(
          mainAxisAlignment:
              isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 6),
                  decoration: BoxDecoration(
                    color: isSender
                        ? AppColors.primaryColor
                        : Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // 🔸 ใช้ Stack เพื่อวางเวลาไว้ล่างขวา
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 14.0, right: 40),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: isSender ? Colors.white : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Text(
                          timeString,
                          style: TextStyle(
                            fontSize: 10,
                            color: isSender
                                ? Colors.white70
                                : Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
