import 'package:chatx_test/widget/profile_tag_add.dart';
import 'package:chatx_test/widget/profile_tag_item.dart';
import 'package:chatx_test/widget/profile_tag_selector.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/model/customer_profile.dart';
import 'package:chatx_test/model/tag.dart';
import 'package:chatx_test/data/mock_tag_data.dart';

class CustomerProfileTag extends StatefulWidget {
  final CustomerProfile profile;

  const CustomerProfileTag({super.key, required this.profile});

  @override
  State<CustomerProfileTag> createState() => _CustomerProfileTagState();
}

class _CustomerProfileTagState extends State<CustomerProfileTag> {
  bool isEditing = false;

  bool showAvailableTags = false;

  late List<ProfileTagLabel> customerTags; // tag ของลูกค้า
  late List<TagLabel> allTagLabels; // tag ทั้งหมดในระบบ
  late List<TagLabel> _availableTags;

  @override
  void initState() {
    super.initState();

    // ดึง tag ของลูกค้า (flatten ให้เป็น list ของ CustomerTagLabel)
    customerTags =
        widget.profile.customerTags.expand((tag) => tag.tags).toList();

    // ดึง tag ทั้งหมดจาก mock (flatten ให้เป็น list ของ TagLabel)
    allTagLabels = allTags.expand((t) => t.tags).toList();
    _refreshAvailableTags();
  }

  List<TagLabel> get availableTags {
    final customerTagIds = customerTags.map((e) => e.tagLabelId).toSet();
    return allTagLabels
        .where((tag) => !customerTagIds.contains(tag.tagLabelId))
        .toList(); // สมมุติว่าเป็นทั้งหมดที่มีในระบบ
  }

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
      if (!isEditing) {
        showAvailableTags = false; // ออกจากโหมดแก้ไขค่อยปิด
      }
    });
  }

  void addTag(TagLabel newTag) {
    setState(() {
      customerTags.add(
        ProfileTagLabel(
          tagLabelId: newTag.tagLabelId,
          tagLabelName: newTag.tagLabelName,
          tagColor: newTag.tagColor,
        ),
      );
      _refreshAvailableTags();
    });
  }

  void removeTag(int index) {
    setState(() {
      customerTags.removeAt(index);
      _refreshAvailableTags();
    });
  }

  void _refreshAvailableTags() {
    final customerTagIds = customerTags.map((e) => e.tagLabelId).toSet();
    _availableTags = allTagLabels
        .where((tag) => !customerTagIds.contains(tag.tagLabelId))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Tag',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Wrap(
            spacing: 10,
            runSpacing: 6,
            children: [
              for (int i = 0; i < customerTags.length; i++)
                ProfileTagItem(
                  tag: customerTags[i],
                  isEditing: isEditing,
                  onRemove: () => removeTag(i),
                ),
              if (isEditing)
                ProfileTagAdd(onTap: () {
                  setState(() => showAvailableTags = !showAvailableTags);
                }),
            ],
          ),
        ),
        if (isEditing && showAvailableTags && _availableTags.isNotEmpty)
          ProfileTagSelector(
            availableTags: _availableTags,
            onTagSelected: (tag) => addTag(tag),
          ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: toggleEditing,
            child: Text(
              isEditing ? 'Save' : 'Edit',
              style: const TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        const Divider(
          height: 24,
        ),
      ],
    );
  }
}
