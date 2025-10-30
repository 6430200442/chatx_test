import 'package:flutter/material.dart';
// import 'package:chatx_test/widget/profile_tag_edit.dart';
import 'package:chatx_test/model/tag.dart';

class ProfileTagSelector extends StatelessWidget {
  final List<TagLabel> availableTags;
  final Function(TagLabel) onTagSelected;

  const ProfileTagSelector({
    super.key,
    required this.availableTags,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Wrap(
        spacing: 8,
        children: availableTags.map((tag) {
          return GestureDetector(
            onTap: () => onTagSelected(tag),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: tag.tagColor,
              ),
              child: Text(
                tag.tagLabelName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
