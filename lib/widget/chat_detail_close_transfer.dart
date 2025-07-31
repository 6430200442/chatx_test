import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/close_button.dart';
import 'package:chatx_test/widget/tranfer_agent_dropdown.dart';
import 'package:flutter/material.dart';

class ChatDetailCloseTransfer extends StatelessWidget {
  final String? selectedTransfer;
  final void Function(String?) onTransferChanged;
  final VoidCallback onClosePressed;

  const ChatDetailCloseTransfer({
    super.key,
    required this.selectedTransfer,
    required this.onTransferChanged,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      color: Colors.white,
      child: Row(
        children: [
          CloseButtonLabel(onPressed: onClosePressed),
          const SizedBox(width: 10),
          TransferDropdown(
            transfer: AgentList.agents,
            selectedTransfer: selectedTransfer,
            onChanged: onTransferChanged,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ],
      ),
    );
  }
}
