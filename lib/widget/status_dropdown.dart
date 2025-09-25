import 'package:flutter/material.dart';

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
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedStatus,
          hint: const Text('Select Status'),
          style: TextStyle(color: Colors.grey.shade600),
          isExpanded: true,
          items: statuses.map((String status) {
            return DropdownMenuItem<String>(
              value: status,
              child: Text(status),
            );
          }).toList(),
          onChanged: onChanged,
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
