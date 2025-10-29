import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class GroupDropdown extends StatelessWidget {
  final List<String> groups;
  final String? selectedGroup;
  final ValueChanged<String?>? onChanged;
  final BorderRadius borderRadius;

  const GroupDropdown({
    super.key,
    required this.groups,
    this.selectedGroup,
    this.onChanged,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          value: selectedGroup,
          items: groups.map((String group) {
            return DropdownMenuItem<String>(
              value: group,
              child: Row(
                children: [
                  const Icon(Icons.group, color: Colors.grey, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    group,
                    style: const TextStyle(
                      fontSize: 14,
                      // fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    ),
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
