import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:flutter/material.dart';

class ChannelGroupItem extends StatefulWidget {
  final GroupChannel channelGroupItem;
  final VoidCallback onTap;

  const ChannelGroupItem({
    super.key,
    required this.channelGroupItem,
    required this.onTap,
  });

  @override
  State<ChannelGroupItem> createState() => _ChannelGroupItemState();
}

class _ChannelGroupItemState extends State<ChannelGroupItem> {
  late bool isOpen;
  late bool isConnect;

  @override
  void initState() {
    super.initState();
    isOpen = widget.channelGroupItem.isOpen;
    isConnect = widget.channelGroupItem.isConnect;
  }

  void toggleChannel() {
    setState(() {
      isOpen = !isOpen;
    });
  }

  void connectChannel() {
    setState(() {
      isConnect = true;
      isOpen = false; 
    });
  }

  void disconnectChannel() {
    setState(() {
      isConnect = false;
      isOpen = false; // reset ค่า
    });
  }

  @override
  Widget build(BuildContext context) {
    // final channelKey = widget.channelGroupItem.channelName.toLowerCase();

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
          backgroundImage: AssetImage(ChannelImage2.rgb[widget.channelGroupItem.channelName.toLowerCase()]!),
          radius: 24,
        ),
        title: Text(
          widget.channelGroupItem.channelName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.black87,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: !isConnect
            ? ElevatedButton(
                onPressed: connectChannel,
                child: const Text('Connect'),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: toggleChannel,
                    child: Icon(
                      isOpen ? Icons.toggle_on : Icons.toggle_off,
                      color: isOpen ? Colors.green : Colors.grey,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: disconnectChannel,
                  ),
                ],
              ),
        onTap: widget.onTap,
      ),
    );
  }
}
