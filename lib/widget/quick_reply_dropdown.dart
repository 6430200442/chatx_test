// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

// class QuickReplyDropdown extends StatefulWidget {
//   const QuickReplyDropdown({super.key});

//   @override
//   State<QuickReplyDropdown> createState() => _QuickReplyDropdownState();
// }

// class _QuickReplyDropdownState extends State<QuickReplyDropdown> {
//   final List<String> items = [
//     'Join Chat',
//     'Whisper to Agent',
//   ];

//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // height: 30,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(5),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 2),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//           isExpanded: true,
//           hint: const Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Join Chat',
//                 style: TextStyle(
//                   fontSize: 12,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           value: selectedValue,
//           items: items
//               .map(
//                 (item) => DropdownMenuItem<String>(
//                   value: item,
//                   child: Text(
//                     item,
//                     style: const TextStyle(fontSize: 12, color: Colors.black),
//                   ),
//                 ),
//               )
//               .toList(),
//           onChanged: (value) {
//             setState(() {
//               selectedValue = value;
//             });

//             // if (value == 'Join Chat') {
//             //   ScaffoldMessenger.of(context).showSnackBar(
//             //     const SnackBar(content: Text('Joined chat!')),
//             //   );
//             // } else if (value == 'Whisper to Agent') {
//             //   Navigator.push(
//             //     context,
//             //     MaterialPageRoute(builder: (_) => const WhisperPage()),
//             //   );
//             // }
//           },
//           buttonStyleData: const ButtonStyleData(
//             height: 10,
//             padding: EdgeInsets.symmetric(horizontal: 2),
//           ),
//           // iconStyleData: const IconStyleData(
//           //   icon: SizedBox.shrink(), // ไม่แสดงไอคอนเลย
//           //   iconSize: 0,
//           // ),
//           iconStyleData: const IconStyleData(
//             icon: Icon(Icons.arrow_drop_up, color: Colors.black),
//             // openMenuIcon: Icon(Icons.arrow_drop_up, color: Colors.black),
//             iconSize: 16,
//           ),
//           dropdownStyleData: DropdownStyleData(
//             width: 110,
//             maxHeight: 80,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(5),
//                 bottomRight: Radius.circular(5),
//               ), // โค้งเฉพาะขอบล่าง
//               border: Border(
//                 left: BorderSide(color: Colors.grey,),
//                 right: BorderSide(color: Colors.grey),
//                 bottom: BorderSide(color: Colors.grey,),
//                 top: BorderSide.none, // ไม่มีขอบบน
//               ),
//             ),
//             elevation: 0,
//             offset: const Offset(0, -130),
//             // direction: DropdownDirection.,
//           ),
//           menuItemStyleData: const MenuItemStyleData(
//             height: 20,
//             overlayColor: WidgetStatePropertyAll(Colors.grey),
//             padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class QuickReplyDropdown extends StatefulWidget {
  // final List<String> quickReplies;
  // final Function(String) onEdit;
  // final Function(String) onDelete;
  // final VoidCallback onAdd;

  const QuickReplyDropdown({
    super.key,
    // required this.quickReplies,
    // required this.onEdit,
    // required this.onDelete,
    // required this.onAdd,
  });

  @override
  State<QuickReplyDropdown> createState() => _QuickReplyDropdownState();
}

class _QuickReplyDropdownState extends State<QuickReplyDropdown> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;

  void _toggleDropdown() {
    if (_isMenuOpen) {
      _closeMenu();
    } else {
      _openMenu();
    }
  }

  void _openMenu() {
    final entry = _createOverlayEntry();
    if (entry != null) {
      Overlay.of(context, rootOverlay: true)?.insert(entry);
      _overlayEntry = entry;
      _isMenuOpen = true;
    }
  }

  void _closeMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isMenuOpen = false;
  }

  OverlayEntry? _createOverlayEntry() {
    final renderObject = context.findRenderObject();
    if (renderObject == null || renderObject is! RenderBox) return null;

    RenderBox renderBox = renderObject;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy - 180, // แสดงด้านบน
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, -size.height - 8),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(8),
              // child: Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     SizedBox(
              //       height: 120,
              //       child: Scrollbar(
              //         thumbVisibility: true,
              //         radius: const Radius.circular(10),
              //         child: ListView.builder(
              //           itemCount: widget.quickReplies.length,
              //           itemBuilder: (context, index) {
              //             final item = widget.quickReplies[index];
              //             return Padding(
              //               padding: const EdgeInsets.symmetric(vertical: 4.0),
              //               child: Row(
              //                 children: [
              //                   Expanded(
              //                     child: Text(
              //                       item,
              //                       style: const TextStyle(fontSize: 12),
              //                       overflow: TextOverflow.ellipsis,
              //                     ),
              //                   ),
              //                   IconButton(
              //                     icon: const Icon(Icons.edit, size: 16),
              //                     color: Colors.blueGrey,
              //                     onPressed: () => widget.onEdit(item),
              //                   ),
              //                   IconButton(
              //                     icon: const Icon(Icons.delete, size: 16),
              //                     color: Colors.redAccent,
              //                     onPressed: () => widget.onDelete(item),
              //                   ),
              //                 ],
              //               ),
              //             );
              //           },
              //         ),
              //       ),
              //     ),
              //     const Divider(height: 10, color: Colors.grey),
              //     InkWell(
              //       onTap: widget.onAdd,
              //       child: Container(
              //         width: double.infinity,
              //         alignment: Alignment.center,
              //         padding: const EdgeInsets.symmetric(vertical: 8),
              //         decoration: BoxDecoration(
              //           color: Colors.grey.shade100,
              //           borderRadius: BorderRadius.circular(5),
              //         ),
              //         child: const Text(
              //           '+ Add Quick Reply',
              //           style: TextStyle(
              //             color: Colors.blue,
              //             fontSize: 12,
              //             fontWeight: FontWeight.w500,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Quick Reply',
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
              Spacer(),
              Icon(Icons.arrow_drop_up, size: 18, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _closeMenu();
    super.dispose();
  }
}
