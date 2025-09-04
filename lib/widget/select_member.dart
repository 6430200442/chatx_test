import 'package:chatx_test/model/group_manage.dart';
import 'package:flutter/material.dart';

class SelectMember extends StatelessWidget {
  final List<GroupMember> members;
  final bool isDeleteMode;
  final Set<String> selectedMembers;
  final ValueChanged<String> onToggleSelect;

  const SelectMember({
    super.key,
    required this.members,
    required this.isDeleteMode,
    required this.selectedMembers,
    required this.onToggleSelect,
  });

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return const Center(child: Text("ไม่มีสมาชิกในกลุ่มนี้"));
    }

    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        final member = members[index];
        final isSelected = selectedMembers.contains(member.memberId);

        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(member.memberImage)),
          title: Text("${member.firstName} ${member.lastName}"),
          trailing: isDeleteMode
              ? Checkbox(
                  value: isSelected,
                  onChanged: (_) => onToggleSelect(member.memberId),
                )
              : null,
        );
      },
    );
  }
}
