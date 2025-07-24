import 'package:flutter/material.dart';

class ChannelDropdown extends StatelessWidget {
  final List<String> channels;
  final String? selectedChannel;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const ChannelDropdown({
    super.key,
    required this.channels,
    this.selectedChannel,
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
          value: selectedChannel,
          hint: const Text('Select Channel'),
          style: TextStyle(color: Colors.grey.shade600),
          isExpanded: true,
          items: channels.map((String channel) {
            return DropdownMenuItem<String>(
              value: channel,
              child: Text(channel),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
