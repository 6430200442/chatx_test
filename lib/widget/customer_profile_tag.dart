// import 'package:chatx_test/widget/profile_tag_show.dart';
import 'package:flutter/material.dart';
// import 'package:chatx_test/widget/profile_tag_edit.dart';
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

  late List<CustomerTagLabel> customerTags; // tag ของลูกค้า
  late List<TagLabel> allTagLabels; // tag ทั้งหมดในระบบ
  late List<TagLabel> _availableTags;

  @override
  void initState() {
    super.initState();
    
    // ดึง tag ของลูกค้า (flatten ให้เป็น list ของ CustomerTagLabel)
    customerTags = widget.profile.customerTags
        .expand((tag) => tag.tags)
        .toList();

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
        CustomerTagLabel(
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
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: customerTags[i].tagColor,
                      ),
                      child: Text(
                        customerTags[i].tagLabelName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    if (isEditing)
                      Positioned(
                        top: -6,
                        right: -6,
                        child: GestureDetector(
                          onTap: () => removeTag(i),
                          child: const CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Icon(Icons.close,
                                size: 12, color: Colors.white),
                          ),
                        ),
                      ),
                  ],
                ),
              if (isEditing)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showAvailableTags = !showAvailableTags;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(Icons.add),
                  ),
                ),
            ],
          ),
        ),
        if (isEditing && showAvailableTags && _availableTags.isNotEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Wrap(
              spacing: 8,
              children: _availableTags.map((tag) {
                return GestureDetector(
                  onTap: () => addTag(tag),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[100],
                    ),
                    child: Text(
                      tag.tagLabelName,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: toggleEditing,
            child: Text(
              isEditing ? 'บันทึก' : 'แก้ไข',
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
