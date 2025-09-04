import 'package:flutter/material.dart';
import 'package:chatx_test/model/group_manage.dart';

class MemberItem extends StatelessWidget {
  final GroupMember memberItem;
  final VoidCallback onTap;
  final VoidCallback? onToggleSelect;
  final VoidCallback? onEdit;
  final bool isDeleteMode;
  final bool isSelected;

  const MemberItem({
    super.key,
    required this.memberItem,
    required this.onTap,
    this.onToggleSelect,
    this.onEdit,
    this.isDeleteMode = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            if (isDeleteMode) ...[
              Checkbox(
                value: isSelected,
                onChanged: (_) => onToggleSelect?.call(),
                shape: const CircleBorder(), // ทำให้เป็นวงกลม
                side: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
                activeColor: Colors.green, // สีของวงกลมเมื่อถูกเลือก
                checkColor: Colors.white, // สีของเครื่องหมายถูก
              ),
              const SizedBox(width: 2),
            ],
            CircleAvatar(
              backgroundImage: NetworkImage(memberItem.memberImage),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${memberItem.firstName} ${memberItem.lastName}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Role : ${memberItem.role}',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onEdit,
              style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                minimumSize: Size.zero, // ลดขนาดปุ่มให้พอดีกับข้อความ
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'แก้ไข',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
