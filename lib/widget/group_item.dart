import 'package:flutter/material.dart';
import 'package:chatx_test/model/group_manage.dart';

class GroupItem extends StatelessWidget {
  final GroupManage groupItem;
  final VoidCallback onTap;

  const GroupItem({
    super.key,
    required this.groupItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(groupItem.groupImage),
          radius: 24,
        ),
        title: Text(
          groupItem.groupName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            for (var member in groupItem.groupMember!.take(4))
              Padding(
                padding: const EdgeInsets.only(right: 4),
                child: CircleAvatar(
                  backgroundImage: AssetImage(member.memberImage),
                  radius: 12,
                ),
              ),
            if ((groupItem.groupMember?.length ?? 0) > 4)
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '+${(groupItem.groupMember?.length ?? 0) - 4}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
