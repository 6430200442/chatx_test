import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/close_button.dart';
import 'package:chatx_test/widget/tranfer_agent_dropdown.dart';
import 'package:flutter/material.dart';

class ChatDetailCloseTransfer extends StatelessWidget {
  final String? selectedTransfer;
  final void Function(String?) onTransferChanged;
  final VoidCallback onClosePressed;
  final String? agentName;

  const ChatDetailCloseTransfer({
    super.key,
    required this.selectedTransfer,
    required this.onTransferChanged,
    required this.onClosePressed,
    required this.agentName,
  });

  @override
  Widget build(BuildContext context) {

    // กรองชื่อตัวเองออก ถ้าเป็น agent ที่ดูแลแชทนี้อยู่
    final filteredAgents = AgentList.agents
        .where((name) => name != agentName && name != 'All Agents')
        .toList();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      color: Colors.white,
      child: Row(
        children: [
          CloseButtonLabel(onPressed: onClosePressed),
          const SizedBox(width: 10),
          TransferDropdown(
            transfer: filteredAgents,
            selectedTransfer: selectedTransfer,
            onChanged: onTransferChanged,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ],
      ),
    );
  }
}
