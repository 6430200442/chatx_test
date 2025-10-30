import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/model/group_manage.dart';
import 'package:chatx_test/pages/create_member.dart';
import 'package:chatx_test/pages/edit_member_role.dart';
import 'package:chatx_test/widget/create_member_button.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:chatx_test/widget/delete_button_bar.dart';
import 'package:chatx_test/widget/delete_dialog.dart';
import 'package:chatx_test/widget/edit_group_name.dart';
import 'package:chatx_test/widget/member_item.dart';
import 'package:chatx_test/widget/role_dropdown.dart';
import 'package:chatx_test/widget/search_box.dart';
// import 'package:chatx_test/widget/select_member.dart';
import 'package:flutter/material.dart';

class GroupMemberPage extends StatefulWidget {
  final GroupManage group;
  final GroupManageController controller;
  const GroupMemberPage(
      {super.key, required this.group, required this.controller});

  @override
  State<GroupMemberPage> createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends State<GroupMemberPage> {
  late final GroupManageController memberController;
  late GroupManage currentGroup;
  String? selectedRole = 'All Role';
  bool _showFilterBar = false;
  bool _isDeleteMode = false;
  Set<String> _selectedMembers = {};

  @override
  void initState() {
    super.initState();
    memberController = GroupManageController();
    currentGroup = widget.group;
  }

  void filterChats() {
    memberController.filter(
      search: memberController.searchController.text,
      role: selectedRole,
    );
  }

  @override
  void dispose() {
    memberController.dispose();
    super.dispose();
  }

  void _deleteGroup() {
    showDialog(
      context: context,
      builder: (_) => DeleteDialog(
        title: "Delete Group Confirmation",
        content: "Are you sure you want to delete this group?",
        confirmText: "Delete",
        onConfirm: () {
          widget.controller.deleteGroup(widget.group.groupId);
          Navigator.pop(context);
          Navigator.pop(context); // กลับไปหน้า GroupManagePage
        },
      ),
    );
  }

  void _deleteSelectedMembers() {
    if (_selectedMembers.isEmpty) return;

    showDialog(
      context: context,
      builder: (_) => DeleteDialog(
        title: "Confirm Delete Members",
        content:
            "Are you sure you want to delete ${_selectedMembers.length} members?",
        confirmText: "Delete",
        onConfirm: () {
          widget.controller
              .deleteMembers(widget.group.groupId, _selectedMembers.toList());
          setState(() {
            // อัปเดต currentGroup
            currentGroup = currentGroup.copyWith(
              groupMember: currentGroup.groupMember
                  ?.where((m) => !_selectedMembers.contains(m.memberId))
                  .toList(),
            );
            _selectedMembers.clear();
            _isDeleteMode = false;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void _deleteAllMembers() {
    showDialog(
      context: context,
      builder: (_) => DeleteDialog(
        title: "Confirm Delete All Members",
        content: "Are you sure you want to delete all members in this group?",
        confirmText: "Delete All",
        onConfirm: () {
          widget.controller.deleteAllMembers(widget.group.groupId);
          setState(() {
            // อัปเดต currentGroup
            currentGroup = currentGroup.copyWith(groupMember: []);
            _selectedMembers.clear();
            _isDeleteMode = false;
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void _editMemberRole(GroupMember member) {
    List<String> availableRoles =
        RoleList.roles.where((role) => role != member.role).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => EditMemberRolePage(
          group: currentGroup,
          member: member,
          availableRoles: availableRoles,
          onRoleUpdated: (newRole) {
            setState(() {
              int index = currentGroup.groupMember!
                  .indexWhere((m) => m.memberId == member.memberId);
              currentGroup.groupMember![index] =
                  currentGroup.groupMember![index].copyWith(role: newRole);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        iconTheme: const IconThemeData(color: AppColors.backButton),
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: const Text('Group Member'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.group.groupImage),
                    ),
                    const SizedBox(width: 5.0),
                    const Text(
                      'Group ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: EditGroupName(
                        groupName: widget.group.groupName,
                        onSave: (newName) {
                          setState(() {
                            currentGroup = currentGroup.copyWith(
                                groupName: newName); // อัปเดตชื่อกลุ่ม
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Flexible(
                        child: SearchBox(
                          controller: memberController.searchController,
                          onSearch: () {
                            filterChats();
                          },
                          onFilter: () {
                            setState(() {
                              _showFilterBar = !_showFilterBar;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                if (_showFilterBar) ... [
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Row',
                              style: TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 180, 
                              height: 30,
                              child: RoleDropdown(
                                roles: RoleList.roles,
                                selectedRole: selectedRole,
                                onChanged: (value) {
                                  setState(() {
                                    selectedRole = value;
                                    filterChats();
                                  });
                                },
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
                //ปุ่ม Action
                DeleteButtonBar(
                  isDeleteMode: _isDeleteMode,
                  onDeleteGroup: _deleteGroup,
                  onDeleteMemberMode: () {
                    setState(() => _isDeleteMode = true);
                  },
                  onDeleteSelected: _deleteSelectedMembers,
                  onDeleteAll: _deleteAllMembers,
                  onCancel: () {
                    setState(() {
                      _isDeleteMode = false; // ปิดโหมดลบ
                      _selectedMembers.clear();
                    });
                  },
                ),
            
                const SizedBox(height: 5.0),
                Expanded(
                  child: ValueListenableBuilder<TextEditingValue>(
                    valueListenable: memberController.searchController,
                    builder: (context, searchValue, _) {
                      List<GroupMember> filteredMembers =
                          currentGroup.groupMember ?? [];
            
                      // filter by role
                      if (selectedRole != null && selectedRole != 'All Role') {
                        filteredMembers = filteredMembers
                            .where((member) =>
                                member.role.toLowerCase() ==
                                selectedRole!.toLowerCase())
                            .toList();
                      }
                      // filter by search
                      if (searchValue.text.isNotEmpty) {
                        filteredMembers = filteredMembers
                            .where((member) =>
                                '${member.firstName} ${member.lastName}'
                                    .toLowerCase()
                                    .contains(searchValue.text.toLowerCase()))
                            .toList();
                      }
                      return ListView.builder(
                        itemCount: filteredMembers.length,
                        itemBuilder: (context, index) {
                          final member = filteredMembers[index];
                          return MemberItem(
                            memberItem: member,
                            isDeleteMode: _isDeleteMode,
                            isSelected:
                                _selectedMembers.contains(member.memberId),
                            onTap: () {},
                            onToggleSelect: () {
                              setState(() {
                                if (_selectedMembers.contains(member.memberId)) {
                                  _selectedMembers.remove(member.memberId);
                                } else {
                                  _selectedMembers.add(member.memberId);
                                }
                              });
                            },
                            onEdit: () => _editMemberRole(member),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CreateMemberButton(
        onPressed: () async {
          final newMemberName = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CreateMember(groupName: widget.group.groupName)),
          );

          if (newMemberName != null && newMemberName is String) {
            memberController.addMember(widget.group.groupId, newMemberName);
          }
        },
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
