// import 'package:flutter/material.dart';
// import 'package:chatx_test/widget/channel_dropdown.dart';
// import 'package:chatx_test/widget/agent_dropdown.dart';
// import 'package:chatx_test/widget/status_dropdown.dart';
// import 'package:chatx_test/constant/app_constants.dart';

// class FilterDialog extends StatefulWidget {
//   final String? selectedChannel;
//   final String? selectedAgent;
//   final String? selectedStatus;

//   const FilterDialog({
//     super.key,
//     this.selectedChannel,
//     this.selectedAgent,
//     this.selectedStatus,
//   });

//   @override
//   State<FilterDialog> createState() => _FilterDialogState();
// }

// class _FilterDialogState extends State<FilterDialog> {
//   String? channel;
//   String? agent;
//   String? status;

//   @override
//   void initState() {
//     super.initState();
//     channel = widget.selectedChannel;
//     agent = widget.selectedAgent;
//     status = widget.selectedStatus;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Filter'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           ChannelDropdown(
//             channels: ChannelList.channels,
//             selectedChannel: channel,
//             onChanged: (value) => setState(() => channel = value),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           const SizedBox(height: 8),
//           AgentDropdown(
//             agents: AgentList.agents,
//             selectedAgent: agent,
//             onChanged: (value) => setState(() => agent = value),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           const SizedBox(height: 8),
//           StatusDropdown(
//             statuses: StatusList.statuses,
//             selectedStatus: status,
//             onChanged: (value) => setState(() => status = value),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context, {
//               'channel': channel,
//               'agent': agent,
//               'status': status,
//             });
//           },
//           child: const Text('Apply'),
//         ),
//         TextButton(
//           onPressed: () => Navigator.pop(context),
//           child: const Text('Cancel'),
//         ),
//       ],
//     );
//   }
// }