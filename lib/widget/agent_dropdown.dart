import 'package:flutter/material.dart';

class AgentDropdown extends StatelessWidget {
  final List<String> agents;
  final String? selectedAgent;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const AgentDropdown({
    super.key,
    required this.agents,
    this.selectedAgent,
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
          value: selectedAgent,
          hint: const Text('Select Agent'),
          style: TextStyle(color: Colors.grey.shade600),
          isExpanded: true,
          items: agents.map((String agent) {
            return DropdownMenuItem<String>(
              value: agent,
              child: Text(agent),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
