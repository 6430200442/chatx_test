import 'package:chatx_test/model/customer_contact.dart';
import 'package:chatx_test/widget/bottom_nav_bar.dart';
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
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        titleTextStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
        title: const Text('Customer Contact'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              Container(
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(OwnerInfo.ownerImage),
                    ),
                    Flexible(
                      child: SearchBox(
                        controller: contactController.searchController,
                        onSearch: () {
                          filterChats();
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.filter_list),
                      onPressed: () {
                        setState(() {
                          _showFilterBar = !_showFilterBar;
                        });
                      },
                    ),
                  ],
                ),
              ),
              if (_showFilterBar)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 5.0),
                  child: Column(
                    children: [
                      ChannelDropdown(
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
                      const SizedBox(height: 8),
                      GroupDropdown(
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
                      const SizedBox(height: 8),
                      TagDropdown(
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
                    ],
                  ),
                ),
              const SizedBox(height: 2.0),
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
      bottomNavigationBar: const BottomNavBar(currentIndex: 1),
      backgroundColor: AppColors.primaryColor,
    );
  }
}
