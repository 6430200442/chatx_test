import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class StatusDropdown extends StatelessWidget {
  final List<String> statuses;
  final String? selectedStatus;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const StatusDropdown({
    super.key,
    required this.statuses,
    this.selectedStatus,
    this.onChanged,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(color: Colors.grey),
        color: Colors.white,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: selectedStatus,
          items: statuses.map((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Row(
                children: [
                  const Icon(Icons.insert_chart_outlined_rounded, color: Colors.grey, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    status,
                    style: const TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,

          // 🎨 ปรับสไตล์ของ dropdown button
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),

          // 📋 ปรับสไตล์ของเมนู
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200, // แสดงได้สูงสุดประมาณ 4 item (scroll ได้)
            width: 180,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              border: Border(
                left: BorderSide(color: Colors.grey,),
                right: BorderSide(color: Colors.grey),
                bottom: BorderSide(color: Colors.grey,),
                top: BorderSide.none, // ไม่มีขอบบน
              ),
            ),
            elevation: 0,
          ),

          // แถบสีเทาเมื่อ hover / กด
          menuItemStyleData: const MenuItemStyleData(
            overlayColor: WidgetStatePropertyAll(Colors.grey),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';

// class StatusDropdown extends StatelessWidget {
//   final List<String> statuses;
//   final String? selectedStatus;
//   final ValueChanged<String?>? onChanged;
//   final BorderRadius borderRadius;

//   const StatusDropdown({
//     super.key,
//     required this.statuses,
//     this.selectedStatus,
//     this.onChanged,
//     required this.borderRadius,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final double containerWidth = MediaQuery.of(context).size.width;

//     return Container(
//       width: containerWidth,
//       height: 50,
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
//       decoration: BoxDecoration(
//         borderRadius: borderRadius,
//         border: Border.all(color: Colors.white),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: DropdownButtonHideUnderline(
//         child: DropdownButton2<String>(
//           isExpanded: true,
//           hint: const Text('Select Status'),
//           value: selectedStatus,
//           items: statuses
//               .map((status) => DropdownMenuItem<String>(
//                     value: status,
//                     child: Text(status),
//                   ))
//               .toList(),
//           onChanged: onChanged,
//           buttonHeight: 50,
//           buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
//           itemHeight: 50,
//           dropdownWidth: containerWidth - 32, // ลบ padding ซ้ายขวา
//           dropdownDecoration: BoxDecoration(
//             borderRadius: borderRadius,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
