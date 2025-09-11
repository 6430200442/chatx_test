import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:flutter/material.dart';

// class ChannelGroupItem extends StatefulWidget {
//   final GroupChannel channelGroupItem;
//   final VoidCallback onTap;
//   final Function(GroupChannel) onUpdate;

//   const ChannelGroupItem({
//     super.key,
//     required this.channelGroupItem,
//     required this.onTap,
//     required this.onUpdate,
//   });

//   @override
//   State<ChannelGroupItem> createState() => _ChannelGroupItemState();
// }

// class _ChannelGroupItemState extends State<ChannelGroupItem> {
//   late bool isOpen;
//   late bool isConnect;

//   @override
//   void initState() {
//     super.initState();
//     isOpen = widget.channelGroupItem.isOpen;
//     isConnect = widget.channelGroupItem.isConnect;
//   }

//   // void toggleChannel() {
//   //   setState(() {
//   //     isOpen = !isOpen;
//   //   });
//   // }

//   // void connectChannel() {
//   //   setState(() {
//   //     isConnect = true;
//   //     isOpen = false;
//   //   });
//   // }

//   // void disconnectChannel() {
//   //   setState(() {
//   //     isConnect = false;
//   //     isOpen = false; // reset ค่า
//   //   });
//   // }

//   void connectChannel() {
//     final updated =
//         widget.channelGroupItem.copyWith(isConnect: true, isOpen: false);

//     widget.onUpdate(updated); // ✅ ส่งกลับไปบอก parent ว่า state เปลี่ยนแล้ว
//   }

//   void disconnectChannel() {
//     final updated =
//         widget.channelGroupItem.copyWith(isConnect: false, isOpen: false);

//     widget.onUpdate(updated);
//   }

//   void toggleChannel() {
//     final updated = widget.channelGroupItem
//         .copyWith(isOpen: !widget.channelGroupItem.isOpen);

//     widget.onUpdate(updated);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final channelKey = widget.channelGroupItem.channelName.toLowerCase();

//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 5,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(ChannelImage2
//               .rgb[widget.channelGroupItem.channelName.toLowerCase()]!),
//           radius: 24,
//         ),
//         title: Text(
//           widget.channelGroupItem.channelName,
//           style: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//             color: Colors.black87,
//           ),
//           overflow: TextOverflow.ellipsis,
//         ),
//         trailing: !isConnect
//             ? ElevatedButton(
//                 onPressed: connectChannel,
//                 child: const Text('Connect'),
//               )
//             : Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   GestureDetector(
//                     onTap: toggleChannel,
//                     child: Icon(
//                       isOpen ? Icons.toggle_on : Icons.toggle_off,
//                       color: isOpen ? Colors.green : Colors.grey,
//                       size: 40,
//                     ),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                     onPressed: disconnectChannel,
//                   ),
//                 ],
//               ),
//         onTap: widget.onTap,
//       ),
//     );
//   }
// }





class ChannelGroupItem extends StatelessWidget {
  final GroupChannel channelGroupItem;
  final VoidCallback onTap;
  final Function(GroupChannel) onUpdate;

  const ChannelGroupItem({
    super.key,
    required this.channelGroupItem,
    required this.onTap,
    required this.onUpdate,
  });

  void connectChannel() {
    final updated = channelGroupItem.copyWith(isConnect: true, isOpen: false);
    onUpdate(updated);
  }

  void disconnectChannel() {
    final updated = channelGroupItem.copyWith(isConnect: false, isOpen: false);
    onUpdate(updated);
  }

  void toggleChannel() {
    final updated = channelGroupItem.copyWith(isOpen: !channelGroupItem.isOpen);
    onUpdate(updated);
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: connectChannel,
                child: const Text('Connect'),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: toggleChannel,
                    child: Icon(
                      channelGroupItem.isOpen
                          ? Icons.toggle_on
                          : Icons.toggle_off,
                      color: channelGroupItem.isOpen
                          ? Colors.green
                          : Colors.grey,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: disconnectChannel,
                  ),
                ],
              ),
        onTap: onTap,
      ),
    );
  }
}
