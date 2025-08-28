import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/chat_controller.dart';
// import 'package:chatx_test/model/group_manage.dart';
// import 'package:chatx_test/widget/bottom_nav_bar.dart';
// import 'package:chatx_test/widget/create_group_button.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
// import 'package:chatx_test/widget/group_item.dart';
// import 'package:chatx_test/widget/role_dropdown.dart';
// import 'package:chatx_test/widget/search_box.dart';
import 'package:flutter/material.dart';

class GroupMemberPage extends StatefulWidget {
  const GroupMemberPage({super.key});

  @override
  State<GroupMemberPage> createState() => _GroupMemberPageState();
}

class _GroupMemberPageState extends State<GroupMemberPage> {
  late final GroupManageController groupController;
  String? selectedRole = 'All Role';
  // bool _showFilterBar = false;

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
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: const Text('Group Manage'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          // child: Column(
          //   children: [
          //     const SizedBox(height: 15.0),
          //     Container(
          //       color: Colors.white,
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          //       child: Row(
          //         children: [
          //           const CircleAvatar(
          //             backgroundImage: AssetImage(OwnerInfo.ownerImage),
          //           ),
          //           Flexible(
          //             child: SearchBox(
          //               controller: groupController.searchController,
          //               onSearch: () {
          //                 filterChats();
          //               },
          //             ),
          //           ),
          //           IconButton(
          //             icon: const Icon(Icons.filter_list),
          //             onPressed: () {
          //               setState(() {
          //                 _showFilterBar = !_showFilterBar;
          //               });
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //     if (_showFilterBar)
          //       Padding(
          //         padding: const EdgeInsets.symmetric(
          //             horizontal: 16.0, vertical: 5.0),
          //         child: Column(
          //           children: [
          //             RoleDropdown(
          //               roles: RoleList.roles,
          //               selectedRole: selectedRole,
          //               onChanged: (value) {
          //                 setState(() {
          //                   selectedRole = value;
          //                   filterChats();
          //                 });
          //               },
          //               borderRadius: BorderRadius.circular(8.0),
          //             ),
          //           ],
          //         ),
          //       ),
          //     const SizedBox(height: 2.0),
          //     Expanded(
          //       child: ValueListenableBuilder<List<GroupManage>>(
          //         valueListenable: groupController.filteredGroup,
          //         builder: (context, filteredList, _) {
          //           return ListView.builder(
          //             itemCount: filteredList.length,
          //             itemBuilder: (context, index) {
          //               final group = filteredList[index];
          //               // ส่ง group และ onTap ให้ GroupItem
          //               return GroupItem(
          //                 groupItem: group,
          //                 onTap: () {},
          //               );
          //             },
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
      // floatingActionButton: CreateGroupButton(onPressed:() {} ),
      // bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      backgroundColor: AppColors.primaryColor,
    );
  }
}