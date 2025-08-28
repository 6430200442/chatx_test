import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ConfirmButton({
    super.key,
    required this.onPressed,
    this.text = 'ยืนยัน',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade100, 
          foregroundColor: Colors.grey,
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 13,    
            fontWeight: FontWeight.bold, 
          ),
          elevation: 4,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      child: Text(text),
    );
  }
}
