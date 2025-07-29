import 'package:flutter/material.dart';

class TransferDropdown extends StatelessWidget {
  final List<String> transfer;
  final String? selectedTransfer;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const TransferDropdown({
    super.key,
    required this.transfer,
    this.selectedTransfer,
    this.onChanged,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
    child: Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
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
          value: selectedTransfer,
          hint: const Text('Select to transfer'),
          style: TextStyle(color: Colors.grey.shade600),
          isExpanded: false,
          items: transfer.map((String channel) {
            return DropdownMenuItem<String>(
              value: channel,
              child: Text(channel),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    ),
    );
  }
}
