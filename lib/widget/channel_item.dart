import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:flutter/material.dart'; 

class ChannelItem extends StatelessWidget {
  final ChannelManage channelItem;
  final VoidCallback onTap;

  const ChannelItem({
    super.key,
    required this.channelItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final members = channelItem.groupChannel ?? [];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
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
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(channelItem.groupImage),
          radius: 24,
        ),
        title: Text(
          channelItem.groupName,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Row(
          children: [
            for (final m in members)
              if (m.isConnect)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      m.isOpen
                          ? ChannelImage2.rgb[m.channelName.toLowerCase()] ?? ''
                          : ChannelImage2.grey[m.channelName.toLowerCase()] ??
                              '',
                    ),
                    radius: 12,
                  ),
                ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
