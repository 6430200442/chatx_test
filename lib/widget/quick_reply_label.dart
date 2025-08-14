import 'package:flutter/material.dart';

class QuickReplyRow extends StatelessWidget {
  final List<String> replies;
  final Function(String) onTap;

  const QuickReplyRow({
    Key? key,
    required this.replies,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // สร้าง list view ที่อยู่ภายใต้ ConstrainedBox (กำหนด maxHeight)
        return ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 140, // = สูงสุด 3 บรรทัด
          ),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: replies.length,
            padding: const EdgeInsets.symmetric(vertical: 4),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final reply = replies[index];
              return GestureDetector(
                onTap: () => onTap(reply),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    reply,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
