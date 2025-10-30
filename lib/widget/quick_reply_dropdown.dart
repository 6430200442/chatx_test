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
  const QuickReplyDropdown({super.key});

  @override
  State<QuickReplyDropdown> createState() => _QuickReplyDropdownState();
}

class _QuickReplyDropdownState extends State<QuickReplyDropdown> {
  final List<String> items = ['Join Chat', 'Whisper to Agent'];
  String? selectedValue;

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isMenuOpen = false;

  void _toggleDropdown() {
    if (_isMenuOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      _isMenuOpen = false;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _isMenuOpen = true;
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Size size = renderBox.size;
    Offset offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        left: offset.dx,
        top: offset.dy - (items.length * 40 + 8),
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, -size.height - 26),
          child: Material(
            color: Colors.white, // พื้นสีขาว
            elevation: 0, // ไม่มีเงา
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.only(
            //     topLeft: Radius.circular(5),
            //     topRight: Radius.circular(5),
            //   ),
            // ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // พื้นสีขาว
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                border: const Border(
                  left: BorderSide(color: Colors.grey),
                  right: BorderSide(color: Colors.grey),
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide.none,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // ชิดซ้าย
                children: items.map((item) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedValue = item;
                        _toggleDropdown();
                      });
                    },
                    child: Container(
                      width: double.infinity, // กว้างเต็มเมนู
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 12),
                      child: Text(
                        item,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                }).toList(),
              ),
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
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                selectedValue ?? 'Quick Reply',
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_drop_up,
                size: 18,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }
}
