import 'package:flutter/material.dart';

class GroupDropdown extends StatelessWidget {
  final List<String> groups;
  final String? selectedGroup;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const GroupDropdown({
    super.key,
    required this.groups,
    this.selectedGroup,
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
          value: selectedGroup,
          hint: const Text('Select Group'),
          style: TextStyle(color: Colors.grey.shade600),
          isExpanded: true,
          items: groups.map((String group) {
            return DropdownMenuItem<String>(
              value: group,
              child: Text(group),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
