import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/controller/chat_controller.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:chatx_test/widget/channel_group_item.dart';
import 'package:chatx_test/widget/curve_body_clipper.dart';
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
  late ChannelManage currentChannel;

  @override
  void initState() {
    super.initState();
    currentChannel = widget.channel;
  }

  // void filterChats() {
  //   widget.controller.filter(
  //     search: widget.controller.searchController.text,
  //   );
  // }

  @override
  void dispose() {
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
                    CircleAvatar(
                      backgroundImage: NetworkImage(widget.channel.groupImage),
                      radius: 24,
                    ),
                    const SizedBox(width: 10.0),
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
              const SizedBox(height: 10.0),
              Expanded(
                child: ValueListenableBuilder<List<ChannelManage>>(
                  valueListenable: widget.controller.filteredChannel,
                  builder: (context, filteredList, _) {
                    final channels = currentChannel.groupChannel ?? [];

                    return ListView.builder(
                      itemCount: channels.length,
                      itemBuilder: (context, index) {
                        final channel = channels[index];
                        return ChannelGroupItem(
                            channelGroupItem: channel,
                            groupName: currentChannel.groupName,
                            onTap: () {},
                            onUpdate: (updatedChannel) {
                              // 1) update local currentChannel
                              final oldChannels =
                                  currentChannel.groupChannel ?? [];
                              final idx = oldChannels.indexWhere((c) =>
                                  c.channelId == updatedChannel.channelId);

                              if (idx != -1) {
                                final updatedChannels =
                                    List<GroupChannel>.from(oldChannels);
                                updatedChannels[idx] = updatedChannel;
                                setState(() {
                                  currentChannel = currentChannel.copyWith(
                                      groupChannel: updatedChannels);
                                });
                              }

                              // update ค่า controller
                              final oldGroups = List<ChannelManage>.from(
                                  widget.controller.filteredChannel.value);
                              final gIdx = oldGroups.indexWhere(
                                  (g) => g.groupId == currentChannel.groupId);

                              if (gIdx != -1) {
                                oldGroups[gIdx] = currentChannel;
                                widget.controller.filteredChannel.value =
                                    oldGroups; // เรียก notify listeners
                              }
                            });
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
