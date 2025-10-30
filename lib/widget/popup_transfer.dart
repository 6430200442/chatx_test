// import 'package:flutter/material.dart';
// import 'agent_dropdown.dart';

// class TransferPopup extends StatefulWidget {
//   final List<String> agents;
//   final void Function(String agent, bool permanent, bool temporary,
//       String note, bool notify, bool attach) onConfirm;

//   const TransferPopup({
//     super.key,
//     required this.agents,
//     required this.onConfirm,
//   });

//   @override
//   State<TransferPopup> createState() => _TransferPopupState();
// }

// class _TransferPopupState extends State<TransferPopup> {
//   String? selectedAgent;
//   bool permanent = false;
//   bool temporary = false;
//   bool notify = false;
//   bool attach = false;
//   final TextEditingController noteController = TextEditingController();
//   int noteLength = 0;

//   @override
//   void initState() {
//     super.initState();
//     noteController.addListener(() {
//       setState(() {
//         noteLength = noteController.text.length;
//         if (noteLength > 100) {
//           noteController.text = noteController.text.substring(0, 100);
//           noteController.selection = TextSelection.fromPosition(
//             TextPosition(offset: 100),
//           );
//           noteLength = 100;
//         }
//       });
//     });
//   }

//   @override
//   void dispose() {
//     noteController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   "Transfer Chat to Another Agent",
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Text(
//                 "Select Agent",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               AgentDropdown(
//                 agents: widget.agents,
//                 selectedAgent: selectedAgent,
//                 onChanged: (value) => setState(() => selectedAgent = value),
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 "Transfer Type",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                       value: permanent,
//                       onChanged: (v) => setState(() => permanent = v!)),
//                   const Text("Permanent", style: TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(width: 5),
//                   Checkbox(
//                       value: temporary,
//                       onChanged: (v) => setState(() => temporary = v!)),
//                   const Text("Temporary", style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 "Note (Optional)",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               Stack(
//                 children: [
//                   TextField(
//                     controller: noteController,
//                     maxLines: 3,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       contentPadding: const EdgeInsets.all(8),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 4,
//                     right: 8,
//                     child: Text("$noteLength/100", style: const TextStyle(fontSize: 12, color: Colors.grey)),
//                   )
//                 ],
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 children: [
//                   Checkbox(
//                       value: notify,
//                       onChanged: (v) => setState(() => notify = v!)),
//                   const Text("Notify recipient of transfer",
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                       value: attach,
//                       onChanged: (v) => setState(() => attach = v!)),
//                   const Text("Attach conversation summary",
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (selectedAgent != null) {
//                           widget.onConfirm(selectedAgent!, permanent, temporary,
//                               noteController.text, notify, attach);
//                           Navigator.pop(context);
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text("Confirm"),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () => Navigator.pop(context),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.red,
//                         foregroundColor: Colors.white,
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                       ),
//                       child: const Text("Cancel"),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class TransferPopup extends StatefulWidget {
  final List<String> agents;
  final void Function(String selectedAgent, bool isPermanent, String note,
      bool notifyRecipient, bool attachSummary) onConfirm;

  const TransferPopup({
    super.key,
    required this.agents,
    required this.onConfirm,
  });

  @override
  State<TransferPopup> createState() => _TransferPopupState();
}

class _TransferPopupState extends State<TransferPopup> {
  String? selectedAgent;
  bool isPermanent = false;
  bool isTemporary = false;
  bool notifyRecipient = false;
  bool attachSummary = false;
  final TextEditingController noteController = TextEditingController();
  int noteLength = 0;
  static const int maxNoteLength = 100;

  void _updateNote(String value) {
    if (value.length > maxNoteLength) {
      noteController.text = value.substring(0, maxNoteLength);
      noteController.selection = TextSelection.fromPosition(
          TextPosition(offset: noteController.text.length));
    }
    setState(() {
      noteLength = noteController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // หัวข้อหลัก
              const Text(
                "Transfer Chat to Another Agent",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Select Agent
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Agent",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    isExpanded: true,
                    hint: const Row(
                      children: [
                        Icon(Icons.support_agent,
                            color: Colors.grey, size: 18),
                        SizedBox(width: 8),
                        Text("All agent"),
                      ],
                    ),
                    value: selectedAgent,
                    items: widget.agents
                        .map((agent) => DropdownMenuItem<String>(
                              value: agent,
                              child: Row(
                                children: [
                                  const Icon(Icons.support_agent,
                                      color: Colors.grey, size: 18),
                                  const SizedBox(width: 8),
                                  Text(agent,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.grey)),
                                ],
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedAgent = value;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      width: 280,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        border: Border(
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                          bottom: BorderSide(color: Colors.grey),
                          top: BorderSide.none,
                        ),
                      ),
                      elevation: 0,
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      overlayColor: WidgetStatePropertyAll(Colors.grey),
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Transfer Type
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Transfer Type",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: isPermanent,
                      onChanged: (v) {
                        setState(() {
                          isPermanent = v ?? false;
                          if (isPermanent) isTemporary = false;
                        });
                      }),
                  const Text(
                    "Permanent",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  Checkbox(
                      value: isTemporary,
                      onChanged: (v) {
                        setState(() {
                          isTemporary = v ?? false;
                          if (isTemporary) isPermanent = false;
                        });
                      }),
                  const Text(
                    "Temporary",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Note
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Note (Optional)",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              Stack(
                children: [
                  TextField(
                    controller: noteController,
                    maxLines: 3,
                    onChanged: _updateNote,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 8),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 8,
                    child: Text("$noteLength/$maxNoteLength",
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Notify / Attach summary
              Row(
                children: [
                  Checkbox(
                      value: notifyRecipient,
                      onChanged: (v) {
                        setState(() {
                          notifyRecipient = v ?? false;
                        });
                      }),
                  const Text(
                    "Notify recipient of transfer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: attachSummary,
                      onChanged: (v) {
                        setState(() {
                          attachSummary = v ?? false;
                        });
                      }),
                  const Text(
                    "Attach conversation summary",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        widget.onConfirm(
                            selectedAgent ?? "",
                            isPermanent,
                            noteController.text,
                            notifyRecipient,
                            attachSummary);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Confirm",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text("Cancel",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
