// import 'package:flutter/material.dart';

// class ProfileNoteEdit extends StatelessWidget {
//   final String label;
//   final TextEditingController controller;
//   final bool isEditing;

//   const ProfileNoteEdit(
//       {super.key,
//       required this.label,
//       required this.controller,
//       required this.isEditing});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 4),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '$label ',
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               width: 8,
//             ),
//             Expanded(
//                 child: isEditing
//                     ? TextField(
//                         controller: controller,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           filled: true,
//                           fillColor: Colors.grey[200],
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(6),
//                             borderSide: BorderSide.none,
//                           ),
//                           contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 25,
//                           ),
//                         ),
//                       )
//                     : Text(
//                         controller.text.isEmpty ? '.....' : controller.text,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ))
//           ],
//         ));
//   }
// }




// import 'package:flutter/material.dart';

// class ProfileNoteEdit extends StatelessWidget {
//   final String label;
//   final TextEditingController controller;
//   final bool isEditing;

//   const ProfileNoteEdit({
//     super.key,
//     required this.label,
//     required this.controller,
//     required this.isEditing,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Label อยู่บรรทัดบน
//           Text(
//             label,
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 14,
//             ),
//           ),
//           const SizedBox(height: 6),
//           // ช่องพิมพ์ / ข้อความ
//           isEditing
//               ? TextField(
//                   controller: controller,
//                   minLines: 3,
//                   maxLines: 6,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6),
//                       borderSide: const BorderSide(color: Colors.blue),
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 10,
//                     ),
//                     hintText: 'Enter note...',
//                     hintStyle: const TextStyle(color: Colors.grey),
//                   ),
//                 )
//               : Container(
//                   width: double.infinity,
//                   height: 100,
//                   padding: const EdgeInsets.all(10),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(6),
//                     border: Border.all(color: Colors.grey),
//                   ),
//                   child: Text(
//                     controller.text.isEmpty ? '.....' : controller.text,
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//         ],
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';

class ProfileNoteEdit extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;
  final int maxLength;

  const ProfileNoteEdit({
    super.key,
    required this.label,
    required this.controller,
    required this.isEditing,
    this.maxLength = 100,
  });

  @override
  State<ProfileNoteEdit> createState() => _ProfileNoteEditState();
}

class _ProfileNoteEditState extends State<ProfileNoteEdit> {
  late bool editingMode;

  @override
  void initState() {
    super.initState();
    editingMode = widget.isEditing;
    widget.controller.addListener(() {
      setState(() {}); // รีเฟรชเพื่ออัพเดตตัวนับตัวอักษร
    });
  }

  @override
  void didUpdateWidget(covariant ProfileNoteEdit oldWidget) {
    super.didUpdateWidget(oldWidget);
    editingMode = widget.isEditing;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            widget.label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 6),
          // Editable Box
          InkWell(
            onTap: () {
              if (!editingMode) {
                setState(() {
                  editingMode = true;
                });
              }
            },
            child: Container(
              width: double.infinity,
              height: 100,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey),
              ),
              child: editingMode
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextField(
                          controller: widget.controller,
                          maxLength: widget.maxLength,
                          maxLines: 5,
                          minLines: 3,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Enter note...',
                          ),
                        ),
                        Text(
                          '${widget.controller.text.length}/${widget.maxLength}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      widget.controller.text.isEmpty
                          ? '.....'
                          : widget.controller.text,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
