// import 'package:chatx_test/pages/chat_list.dart';
// import 'package:chatx_test/pages/home.dart';
// import 'package:chatx_test/pages/notification.dart';
import 'package:chatx_test/constant/app_constants.dart';
import 'package:flutter/material.dart';

// class BottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   const BottomNavBar({super.key, required this.currentIndex});

//   void onItemTap(BuildContext context, int index) {
//     if (index == currentIndex) {
//       return; // ถ้าอยู่หน้าเดิม ไม่ทำอะไร
//     } else if (index == 0) {
//       Navigator.pushReplacementNamed(context, '/chat');
//     } else if (index == 1) {
//       Navigator.pushReplacementNamed(context, '/customer');
//     } else if (index == 2) {
//       Navigator.pushReplacementNamed(context, '/group');
//     } else if (index == 3) {
//       Navigator.pushReplacementNamed(context, '/channel');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: (index) => onItemTap(context, index),
//       items: const [
//         BottomNavigationBarItem(
//           icon: Icon(Icons.chat,color: Colors.blue,),
//           label: 'แชท',
//           labelStyle: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.perm_contact_cal_rounded,color: Colors.blue,),
//           label: 'รายชื่อ',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.group,color: Colors.blue,),
//           label: 'กลุ่ม',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.switch_account,color: Colors.blue,),
//           label: 'แชแนล',
//         ),
//       ],
//     );
//   }
// }

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  const BottomNavBar({super.key, required this.currentIndex});

  void onItemTap(BuildContext context, int index) {
    if (index == currentIndex) return;
    if (index == 0) {
      Navigator.pushReplacementNamed(context, '/chat');
    } else if (index == 1) {
      Navigator.pushReplacementNamed(context, '/customer');
    } else if (index == 2) {
      Navigator.pushReplacementNamed(context, '/group');
    } else if (index == 3) {
      Navigator.pushReplacementNamed(context, '/channel');
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.chat, 'label': 'แชท'},
      {'icon': Icons.perm_contact_cal_rounded, 'label': 'รายชื่อ'},
      {'icon': Icons.group, 'label': 'กลุ่ม'},
      {'icon': Icons.switch_account, 'label': 'แชแนล'},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (index) {
          final isSelected = index == currentIndex;
          return GestureDetector(
            onTap: () => onItemTap(context, index),
            child: Container(
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
