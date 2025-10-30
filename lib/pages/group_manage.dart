import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/controller/profile_controller.dart';
import 'package:chatx_test/model/group_manage.dart';
import 'package:chatx_test/pages/create_group.dart';
import 'package:chatx_test/pages/group_member.dart';
// import 'package:chatx_test/widget/bottom_nav_bar.dart';
import 'package:chatx_test/widget/create_group_button.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:chatx_test/widget/group_item.dart';
import 'package:chatx_test/widget/role_dropdown.dart';
import 'package:chatx_test/widget/search_box.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/user_profile.dart';
import 'package:chatx_test/pages/setting.dart';

class GroupManagePage extends StatefulWidget {
  const GroupManagePage({super.key});

  @override
  State<GroupManagePage> createState() => _GroupManagePageState();
}

class _GroupManagePageState extends State<GroupManagePage> {
  late final GroupManageController groupController;
  String? selectedRole = 'All Role';
  bool _showFilterBar = false;

  @override
  void initState() {
    super.initState();
    groupController = GroupManageController();
  }

  void filterChats() {
    groupController.filter(
      search: groupController.searchController.text,
      role: selectedRole,
    );
  }

  @override
  void dispose() {
    groupController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        titleSpacing: 0, // ให้ชิดขอบซ้ายสุด
        title: Stack(
          alignment: Alignment.center,
          children: [
            // 👤 รูปโปรไฟล์ (ซ้าย)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserProfilePage(),
                      ),
                    );
                  },
                  child: AnimatedBuilder(
                    animation: profileController,
                    builder: (context, _) => CircleAvatar(
                      radius: 14,
                      backgroundImage: profileController.currentImage,
                    ),
                  ),
                ),
              ),
            ),

            // 📄 ชื่อหน้า (ตรงกลางจริง)
            const Center(
              child: Text(
                'Group Manage',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

            // 🔔 กับ ⚙️ (ขวาสุดจริง)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications),
                      color: Colors.white,
                      iconSize: 22,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.settings),
                      color: Colors.white,
                      iconSize: 22,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                Container(
                  color: Colors.white,
                  child: Row(
                    children: [
                      Flexible(
                        child: SearchBox(
                          controller: groupController.searchController,
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
                const SizedBox(height: 15.0),
                Expanded(
                  child: ValueListenableBuilder<List<GroupManage>>(
                    valueListenable: groupController.filteredGroup,
                    builder: (context, filteredList, _) {
                      return ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final group = filteredList[index];
                          // ส่ง group และ onTap ให้ GroupItem
                          return GroupItem(
                            groupItem: group,
                            onTap: () {
                              // Handle group item tap
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => GroupMemberPage(
                                    group: group,
                                    controller: groupController,
                                  ),
                                ),
                              );
                            },
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
      floatingActionButton: CreateGroupButton(
        onPressed: () async {
          final newGroupName = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateGroup()),
          );

          if (newGroupName != null && newGroupName is String) {
            groupController.addGroup(newGroupName);
          }
        },
      ),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
