import 'package:flutter/material.dart';

class TagDropdown extends StatelessWidget {
  final List<String> tags;
  final String? selectedTag;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const TagDropdown({
    super.key,
    required this.tags,
    this.selectedTag,
    this.onChanged,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        border: Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedTag,
          hint: const Text('Select Tag'),
          style: TextStyle(color: Colors.grey.shade600),
          isExpanded: true,
          items: tags.map((String tag) {
            return DropdownMenuItem<String>(
              value: tag,
              child: Text(tag),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
