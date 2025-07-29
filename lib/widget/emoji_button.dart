import 'package:flutter/material.dart';

class EmojiButton extends StatelessWidget {
  final VoidCallback onPressed;

  const EmojiButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.emoji_emotions_outlined),
      onPressed: onPressed,
      tooltip: 'Emoji',
      color: Colors.grey,
    );
  }
}

