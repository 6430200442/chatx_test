import 'package:flutter/material.dart';

class ProfileNoteEdit extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;

  const ProfileNoteEdit(
      {super.key,
      required this.label,
      required this.controller,
      required this.isEditing});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label :',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: isEditing
                    ? TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 25,
                          ),
                        ),
                      )
                    : Text(
                        controller.text.isEmpty ? '.....' : controller.text,
                      ))
          ],
        ));
  }
}
