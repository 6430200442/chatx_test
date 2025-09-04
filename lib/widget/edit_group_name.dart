import 'package:flutter/material.dart';

class EditGroupName extends StatefulWidget {
  final String groupName;
  final ValueChanged<String> onSave;

  const EditGroupName({
    super.key,
    required this.groupName,
    required this.onSave,
  });

  @override
  State<EditGroupName> createState() => _EditGroupNameState();
}

class _EditGroupNameState extends State<EditGroupName> {
  late TextEditingController _controller;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.groupName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    if (_isEditing) {
      // กดบันทึก
      widget.onSave(_controller.text);
    }
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _isEditing
              ? TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                  ),
                )
              : Text(
                  _controller.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: _toggleEdit,
          child: Text(
            _isEditing ? 'บันทึก' : 'แก้ไข',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
