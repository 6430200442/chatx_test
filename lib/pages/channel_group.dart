import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:chatx_test/widget/channel_group_item.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
import 'package:chatx_test/widget/search_box.dart';
import 'package:flutter/material.dart';

class ChannelGroupPage extends StatefulWidget {
  final ChannelManage channel;
  final ChannelManageController controller;
  const ChannelGroupPage(
      {super.key, required this.channel, required this.controller});

  @override
  State<ChannelGroupPage> createState() => _ChannelGroupPageState();
}

class _ChannelGroupPageState extends State<ChannelGroupPage> {
  late final ChannelManageController channelMemberController;
  late ChannelManage currentChannel;

  @override
  void initState() {
    super.initState();
    channelMemberController = ChannelManageController();
    currentChannel = widget.channel;
  }

  void filterChats() {
    channelMemberController.filter(
      search: channelMemberController.searchController.text,
    );
  }

  @override
  void dispose() {
    channelMemberController.dispose();
    super.dispose();
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
        title: const Text('Channel Manage'),
      ),
      body: ClipPath(
        clipper: CurveBodyClipper(),
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 15.0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Row(
                  children: [
                    Text(
                      'Group ${currentChannel.groupName} ',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2.0),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.channel.groupImage),
                    ),
                    Flexible(
                      child: SearchBox(
                        controller: channelMemberController.searchController,
                        onSearch: () {
                          filterChats();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 2.0),
              Expanded(
                child: ValueListenableBuilder<List<ChannelManage>>(
                  valueListenable: channelMemberController.filteredChannel,
                  builder: (context, filteredList, _) {
                    
                    final channels = currentChannel.groupChannel ?? [];

                    return ListView.builder(
                      itemCount: channels.length,
                      itemBuilder: (context, index) {
                        final channel = channels[index];
                        return ChannelGroupItem(
                          channelGroupItem: channel,
                          onTap: () {
                            // handle
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
