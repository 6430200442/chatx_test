import 'package:flutter/material.dart';

class StatusDropdown extends StatelessWidget {
  final List<String> statuses;
  final String? selectedStatus;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const StatusDropdown({
    super.key,
    required this.statuses,
    this.selectedStatus,
    this.onChanged,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16.0, 5.0, 6.0, 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 1.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
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
          value: selectedStatus,
          hint: const Text('Select Status'),
          style: TextStyle(color: Colors.grey.shade600),
          isExpanded: true,
          items: statuses.map((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(status),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
