import 'package:flutter/material.dart';

class DeleteButtonBar extends StatelessWidget {
  final bool isDeleteMode;
  final VoidCallback onDeleteGroup;
  final VoidCallback onDeleteMemberMode;
  final VoidCallback onDeleteSelected;
  final VoidCallback onDeleteAll;
  final VoidCallback onCancel;

  const DeleteButtonBar({
    super.key,
    required this.isDeleteMode,
    required this.onDeleteGroup,
    required this.onDeleteMemberMode,
    required this.onDeleteSelected,
    required this.onDeleteAll,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: isDeleteMode
            ? [
                TextButton(
                  onPressed: onCancel,
                  child: Text("ยกเลิก",
                      style: TextStyle(fontSize: 12, color: Colors.red.shade800)),
                ),
                const Spacer(),
                TextButton(
                    onPressed: onDeleteSelected,
                    child: Text(
                      "ลบที่เลือก",
                      style: TextStyle(fontSize: 12, color: Colors.red.shade800),
                    )),
                const SizedBox(width: 4),
                TextButton(
                    onPressed: onDeleteAll,
                    child: Text(
                      "ลบทั้งหมด",
                      style: TextStyle(fontSize: 12, color: Colors.red.shade800),
                    )),
              ]
            : [
                TextButton(
                    onPressed: onDeleteGroup,
                    child: Text(
                      "ลบกลุ่ม",
                      style: TextStyle(fontSize: 12, color: Colors.red.shade800),
                    )),
                const SizedBox(width: 4),
                TextButton(
                    onPressed: onDeleteMemberMode,
                    child: Text(
                      "ลบสมาชิก",
                      style: TextStyle(fontSize: 12, color: Colors.red.shade800),
                    )),
              ],
      ),
    );
  }
}
