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
  // late ChannelManage currentChannel;
  // late TextEditingController searchController;
  // late ValueNotifier<List<GroupChannel>> filteredMembers;

  // @override
  // void initState() {
  //   super.initState();
  //   currentChannel = widget.channel;
  //   searchController = TextEditingController();
  //   filteredMembers = ValueNotifier(currentChannel.groupChannel ?? []);
  // }

  // void filterChats() {
  //   final search = searchController.text.toLowerCase();
  //   filteredMembers.value = (currentChannel.groupChannel ?? []).where((m) {
  //     return search.isEmpty || m.channelName.toLowerCase().contains(search);
  //   }).toList();
  // }

  // @override
  // void dispose() {
  //   searchController.dispose();
  //   filteredMembers.dispose();
  //   super.dispose();
  // }

  // late final ChannelManageController channelMemberController;
  late ChannelManage currentChannel;

  @override
  void initState() {
    super.initState();
    // channelMemberController = ChannelManageController();
    currentChannel = widget.channel;
  }

  void filterChats() {
    widget.controller.filter(
      search: widget.controller.searchController.text,
    );
  }

  @override
  void dispose() {
    // widget.controller.dispose();
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
              // Container(
              //   color: Colors.white,
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   child: Row(
              //     children: [
              //       CircleAvatar(
              //         backgroundImage: NetworkImage(widget.channel.groupImage),
              //       ),
              //       const SizedBox(width: 5.0),
              //       Flexible(
              //         child:
              //             // SearchBox(
              //             //   controller: widget.controller.searchController,
              //             //   onSearch: () {
              //             //     filterChats();
              //             //   },
              //             // ),
              //             Text(
              //           'Group ${currentChannel.groupName} ',
              //           style: const TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 2.0),
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
                          onTap: () {},
                          onUpdate: (updatedChannel) {
                            setState(() {
                              // อัปเดตค่าใน currentChannel
                              final channels =
                                  currentChannel.groupChannel ?? [];
                              final idx = channels.indexWhere((c) =>
                                  c.channelId == updatedChannel.channelId);

                              if (idx != -1) {
                                channels[idx] = updatedChannel;
                                currentChannel = currentChannel
                                    .copyWith(groupChannel: [...channels]);
                              }
                            });

                            // อัปเดตค่าใน controller ด้วย
                            final groups =
                                widget.controller.filteredChannel.value;
                            final gIdx = groups.indexWhere(
                                (g) => g.groupId == currentChannel.groupId);

                            if (gIdx != -1) {
                              groups[gIdx] = currentChannel;
                              widget.controller.filteredChannel.value = [
                                ...groups
                              ];
                            }
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
