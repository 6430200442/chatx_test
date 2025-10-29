import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:chatx_test/widget/password_dialog_popup.dart';
import 'package:flutter/material.dart';
// import 'package:chatx_test/data/mock_user_login_data.dart'; // import mock login

class ChannelGroupItem extends StatelessWidget {
  final GroupChannel channelGroupItem;
  final VoidCallback onTap;
  final Function(GroupChannel) onUpdate;
  final String groupName;

  const ChannelGroupItem({
    super.key,
    required this.channelGroupItem,
    required this.onTap,
    required this.onUpdate,
    required this.groupName, // เพิ่ม groupName
  });

  void connectChannel(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => PasswordDialog(
        title: "Confirm Connect Channel",
        selectedChannel: channelGroupItem.channelName,
        groupName: groupName,
        onConfirm: () {
          final updated =
              channelGroupItem.copyWith(isConnect: true, isOpen: false);
          onUpdate(updated);
        },
      ),
    );
  }

  void disconnectChannel(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => PasswordDialog(
        title: "Confirm Disconnect Channel",
        selectedChannel: channelGroupItem.channelName,
        groupName: groupName,
        onConfirm: () {
          final updated =
              channelGroupItem.copyWith(isConnect: false, isOpen: false);
          onUpdate(updated);
        },
      ),
    );
  }

  void toggleChannel(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => PasswordDialog(
        title: "Confirm Open/Close Channel",
        selectedChannel: channelGroupItem.channelName,
        groupName: groupName,
        onConfirm: () {
          final updated =
              channelGroupItem.copyWith(isOpen: !channelGroupItem.isOpen);
          onUpdate(updated);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
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
          backgroundImage: AssetImage(
            ChannelImage2.rgb[channelGroupItem.channelName.toLowerCase()]!,
          ),
          radius: 24,
        ),
        title: Text(
          channelGroupItem.channelName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black87,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: !channelGroupItem.isConnect
            ? ElevatedButton(
                onPressed: () => connectChannel(context),
                child: const Text('Connect'),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () => toggleChannel(context),
                    child: Icon(
                      channelGroupItem.isOpen
                          ? Icons.toggle_on
                          : Icons.toggle_off,
                      color:
                          channelGroupItem.isOpen ? Colors.green : Colors.grey,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => disconnectChannel(context),
                  ),
                ],
              ),
        onTap: onTap,
      ),
    );
  }
}
