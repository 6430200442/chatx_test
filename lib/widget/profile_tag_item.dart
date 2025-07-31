import 'package:flutter/material.dart';
// import 'package:chatx_test/widget/profile_tag_edit.dart';
import 'package:chatx_test/model/customer_profile.dart';

class ProfileTagItem extends StatelessWidget {
  final ProfileTagLabel tag;
  final bool isEditing;
  final VoidCallback onRemove;

  const ProfileTagItem({
    super.key,
    required this.tag,
    required this.isEditing,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: tag.tagColor,
          ),
          child: Text(
            tag.tagLabelName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        if (isEditing)
          Positioned(
            top: -6,
            right: -6,
            child: GestureDetector(
              onTap: onRemove,
              child: const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.red,
                child: Icon(Icons.close, size: 12, color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
