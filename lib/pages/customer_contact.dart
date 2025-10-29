import 'package:chatx_test/controller/profile_controller.dart';
import 'package:chatx_test/model/customer_contact.dart';
// import 'package:chatx_test/widget/bottom_nav_bar.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:chatx_test/widget/customer_item.dart';
import 'package:chatx_test/widget/group_dropdown.dart';
import 'package:chatx_test/widget/tag_dropdown.dart';
// import 'package:chatx_test/widget/tag_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/widget/search_box.dart';
import 'package:chatx_test/widget/channel_dropdown.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/pages/setting.dart';
import 'package:chatx_test/pages/user_profile.dart';

class CustomerContactPage extends StatefulWidget {
  const CustomerContactPage({super.key});

  @override
  State<CustomerContactPage> createState() => _CustomerContactPageState();
}

class _CustomerContactPageState extends State<CustomerContactPage> {
  late final CustomerContactController contactController;
  String? selectedChannel = 'All Channel';
  String? selectedTag = 'All Tag';
  String? selectedGroup = 'All Group';
  bool _showFilterBar = false;

  @override
  void initState() {
    super.initState();
    contactController = CustomerContactController();
  }

  void filterChats() {
    contactController.filter(
      search: contactController.searchController.text,
      channel: selectedChannel,
      group: selectedGroup,
      tag: selectedTag,
    );
  }

  @override
  void dispose() {
    contactController.dispose();
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
                'Customer Contact',
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
                          controller: contactController.searchController,
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
                              'Channel',
                              style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 180, 
                              height: 30,
                              child: ChannelDropdown(
                                channels: ChannelList.channels,
                                selectedChannel: selectedChannel,
                                onChanged: (value) {
                                  setState(() {
                                    selectedChannel = value;
                                    filterChats();
                                  });
                                },
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text(
                              'Group',
                              style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 180, 
                              height: 30,
                              child: GroupDropdown(
                                groups: GroupList.groups,
                                selectedGroup: selectedGroup,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGroup = value;
                                    filterChats();
                                  });
                                },
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Text(
                              'Agent',
                              style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              width: 180, 
                              height: 30,
                              child: TagDropdown(
                                tags: TagStatusList.tags,
                                selectedTag: selectedTag,
                                onChanged: (value) {
                                  setState(() {
                                    selectedTag = value;
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
                  child: ValueListenableBuilder<List<CustomerContact>>(
                    valueListenable: contactController.filteredContacts,
                    builder: (context, filteredList, _) {
                      return ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          final customer = filteredList[index];
            
                          // ส่ง customer และ onTap ให้ CustomerItem
                          return CustomerItem(
                            customerContact: customer,
                            onTap: () {},
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
      // bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
