import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:chatx_test/pages/channel_group.dart';
import 'package:chatx_test/widget/channel_dropdown.dart';
import 'package:chatx_test/widget/channel_item.dart';
// import 'package:chatx_test/widget/bottom_nav_bar.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:chatx_test/widget/search_box.dart';
import 'package:flutter/material.dart';

class ChannelManagePage extends StatefulWidget {
  const ChannelManagePage({super.key});

  @override
  State<ChannelManagePage> createState() => _ChannelManagePageState();
}

class _ChannelManagePageState extends State<ChannelManagePage> {
  late final ChannelManageController channelController;
  String? selectedChannel = 'All Channel';
  bool _showFilterBar = false;

  @override
  void initState() {
    super.initState();
    channelController = ChannelManageController();
  }

  void filterChats() {
    channelController.filter(
      search: channelController.searchController.text,
      channel: selectedChannel,
    );
  }

  @override
  void dispose() {
    channelController.dispose();
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
                        controller: channelController.searchController,
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
                    ],
                  ),
                ),
              const SizedBox(height: 2.0),
              Expanded(
                child: ValueListenableBuilder<List<ChannelManage>>(
                  valueListenable: channelController.filteredChannel,
                  builder: (context, filteredList, _) {
                    return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        final channel = filteredList[index];
                        // ส่ง group และ onTap ให้ ChannelItem
                        return ChannelItem(
                          channelItem: channel,
                          onTap: () {
                            // Handle channel item tap
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChannelGroupPage(
                                  channel: channel,
                                  controller: channelController,
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
      backgroundColor: AppColors.primaryColor,
    );
  }
}
