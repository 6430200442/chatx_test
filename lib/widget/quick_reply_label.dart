// import 'package:flutter/material.dart';

// class QuickReplyLabel extends StatelessWidget {
//   final String label;
//   final VoidCallback onTap;
//   const QuickReplyLabel({super.key, required this.onTap, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Text(label,style: const TextStyle(color: Colors.grey),),
//       ),
//     );
//   }
// }

// class QuickReplyRow extends StatelessWidget {
//   final List<String> replies;
//   final Function(String) onTap;

//   const QuickReplyRow({
//     super.key,
//     required this.replies,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.horizontal,
//         child: Row(
//           children: replies.map((reply) {
//             return GestureDetector(
//               onTap: () => onTap(reply),
//               child: Container(
//                 margin: const EdgeInsets.only(right: 8),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                 constraints: const BoxConstraints(maxWidth: 150),
//                 decoration: BoxDecoration(
//                   color: Colors.grey[200],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Text(
//                   reply,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(fontSize: 14),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class QuickReplyRow extends StatelessWidget {
  final List<String> replies;
  final Function(String) onTap;

  const QuickReplyRow({
    super.key,
    required this.replies,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: replies.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final reply = replies[index];
          return GestureDetector(
            onTap: () => onTap(reply),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              constraints: const BoxConstraints(maxWidth: 150),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                reply,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }
}
