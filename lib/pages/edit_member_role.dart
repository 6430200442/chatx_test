import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/model/group_manage.dart';
import 'package:chatx_test/widget/role_dropdown.dart';

class EditMemberRolePage extends StatefulWidget {
  final GroupManage group;
  final GroupMember member;
  final List<String> availableRoles; // role ที่เหลือไม่ซ้ำกับปัจจุบัน
  final ValueChanged<String> onRoleUpdated; // callback ส่งกลับไปอัปเดต

  const EditMemberRolePage({
    super.key,
    required this.group,
    required this.member,
    required this.availableRoles,
    required this.onRoleUpdated,
  });

  @override
  State<EditMemberRolePage> createState() => _EditMemberRolePageState();
}

class _EditMemberRolePageState extends State<EditMemberRolePage> {
  String? selectedRole;

  @override
  void initState() {
    super.initState();
    selectedRole = widget.availableRoles.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.backButton),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: const Text('Edit Member Role'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Group ${widget.group.groupName}',
                    style:
                        const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.member.memberImage),
                        radius: 24,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.member.firstName} ${widget.member.lastName}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text('Role: ${widget.member.role}',
                              style: const TextStyle(fontSize: 13)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                RoleDropdown(
                  roles: widget.availableRoles,
                  selectedRole: selectedRole,
                  borderRadius: BorderRadius.circular(8.0),
                  onChanged: (value) {
                    setState(() => selectedRole = value);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedRole != null) {
                        widget.onRoleUpdated(selectedRole!);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('ยืนยัน',
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
