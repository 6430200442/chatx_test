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
                  child: const Row(
                    children: [
                      Icon(Icons.cancel, size: 12, color: Colors.red),
                      SizedBox(width: 2),
                      Text("Cancel",
                          style: TextStyle(fontSize: 12, color: Colors.red)),
                    ],
                  ),
                ),
                const Spacer(),
                TextButton(
                    onPressed: onDeleteSelected,
                    child: const Row(
                      children: [
                        Icon(Icons.delete, size: 14, color: Colors.red),
                        SizedBox(width: 2),
                        Text(
                          "Delete Selected",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    )),
                const SizedBox(width: 4),
                TextButton(
                    onPressed: onDeleteAll,
                    child: const Row(
                      children: [
                        Icon(Icons.delete_forever, size: 14, color: Colors.red),
                        SizedBox(width: 2),
                        Text(
                          "Delete All",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    )),
              ]
            : [
                TextButton(
                    onPressed: onDeleteGroup,
                    child: const Row(
                      children: [
                        Icon(Icons.group_remove_rounded,
                            size: 14, color: Colors.red),
                        SizedBox(width: 2),
                        Text(
                          "Delete Group",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    )),
                const SizedBox(width: 4),
                TextButton(
                    onPressed: onDeleteMemberMode,
                    child: const Row(
                      children: [
                        Icon(Icons.person_remove, size: 14, color: Colors.red),
                        SizedBox(width: 2),
                        Text(
                          "Delete Members",
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ),
                      ],
                    )),
              ],
      ),
    );
  }
}
