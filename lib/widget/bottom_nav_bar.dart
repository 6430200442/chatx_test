import 'package:chatx_test/constant/app_constants.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.chat, 'label': 'Chat'},
      {'icon': Icons.perm_contact_cal_rounded, 'label': 'Contact'},
      {'icon': Icons.group, 'label': 'Group'},
      {'icon': Icons.switch_account, 'label': 'Channel'},
    ];

    return Container(
      color: Colors.white,
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () => onItemTap(index),
            child: Container(
              width: 80,
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.secondaryColor : Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    items[index]['icon'] as IconData,
                    color: isSelected ? Colors.white : AppColors.secondaryColor,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    items[index]['label'] as String,
                    style: TextStyle(
                      color: isSelected ? Colors.white : AppColors.secondaryColor,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
