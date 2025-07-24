// import 'package:chatx_test/widget/profile_tag_show.dart';
import 'package:flutter/material.dart';
// import 'package:chatx_test/widget/profile_tag_edit.dart';

class CustomerProfileTag extends StatefulWidget {
  const CustomerProfileTag({super.key});

  @override
  State<CustomerProfileTag> createState() => _CustomerProfileTagState();
}

class _CustomerProfileTagState extends State<CustomerProfileTag> {
  bool isEditing = false;

  bool showAvailableTags = false;

  List<String> allTags = [
    'test01',
    'test025678910',
    'test03',
    'test04',
    'test05',
    'test06',
    'test07'
  ];

  List<String> tags = ['test05', 'test06', 'test07'];

  List<String> get availableTags =>
      allTags.where((t) => !tags.contains(t)).toList();

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
      showAvailableTags = false;
    });
  }

  void addTag(String newTag) {
    setState(() {
      tags.add(newTag);
      availableTags.remove(newTag);
    });
  }

  void removeTag(int index) {
    setState(() {
      showAvailableTags = true;
      final removed = tags.removeAt(index);
      if (!availableTags.contains(removed)) {
        availableTags.add(removed);
      }
    });
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
              for (int i = 0; i < tags.length; i++)
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.amber,
                      ),
                      child: Text(
                        tags[i],
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
        if (isEditing && showAvailableTags && availableTags.isNotEmpty)
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
              children: availableTags.map((tag) {
                return GestureDetector(
                  onTap: () => addTag(tag),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue[100],
                    ),
                    child: Text(tag, style: const TextStyle(color: Colors.black),
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
