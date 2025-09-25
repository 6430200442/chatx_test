import 'package:chatx_test/constant/app_constants.dart';
import 'package:chatx_test/model/channel_manage.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/data/mock_user_login_data.dart'; // import mock login

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
    final passwordController = TextEditingController();
    final selectedChannel = channelGroupItem.channelName;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Confirm Connect Channel",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Channel", style: TextStyle(fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child:
                    Text(selectedChannel, style: const TextStyle(fontSize: 13)),
              ),
              const SizedBox(height: 8),
              const Text("Name", style: TextStyle(fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child: Text(groupName, style: const TextStyle(fontSize: 13)),
              ),
              const SizedBox(height: 8),
              const Text("Password", style: TextStyle(fontSize: 13)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[200],
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(fontSize: 13),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter password",
                    hintStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  final inputPassword = passwordController.text;
                  final correctPassword = mockUsers.first.password;

                  if (inputPassword == correctPassword) {
                    final updated = channelGroupItem.copyWith(
                        isConnect: true, isOpen: false);
                    onUpdate(updated);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Password incorrect",
                              style: TextStyle(fontSize: 13))),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(width: 40),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void disconnectChannel(BuildContext context) {
    final passwordController = TextEditingController();
    final selectedChannel = channelGroupItem.channelName;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Confirm Disconnect Channel",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Channel", style: TextStyle(fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child:
                    Text(selectedChannel, style: const TextStyle(fontSize: 13)),
              ),
              const SizedBox(height: 8),
              const Text("Name", style: TextStyle(fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child: Text(groupName, style: const TextStyle(fontSize: 13)),
              ),
              const SizedBox(height: 8),
              const Text("Password", style: TextStyle(fontSize: 13)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[200],
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(fontSize: 13),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter password",
                    hintStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  final inputPassword = passwordController.text;
                  final correctPassword = mockUsers.first.password;

                  if (inputPassword == correctPassword) {
                    final updated = channelGroupItem.copyWith(
                        isConnect: false, isOpen: false);
                    onUpdate(updated);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Password incorrect",
                              style: TextStyle(fontSize: 13))),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(width: 40),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void toggleChannel(BuildContext context) {
    final passwordController = TextEditingController();
    final selectedChannel = channelGroupItem.channelName;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            "Confirm Open/Close Channel",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Channel", style: TextStyle(fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child:
                    Text(selectedChannel, style: const TextStyle(fontSize: 13)),
              ),
              const SizedBox(height: 8),
              const Text("Name", style: TextStyle(fontSize: 13)),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(8),
                color: Colors.grey[200],
                child: Text(groupName, style: const TextStyle(fontSize: 13)),
              ),
              const SizedBox(height: 8),
              const Text("Password", style: TextStyle(fontSize: 13)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.grey[200],
                child: TextField(
                  controller: passwordController,
                  style: const TextStyle(fontSize: 13),
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter password",
                    hintStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  final inputPassword = passwordController.text;
                  final correctPassword = mockUsers.first.password;

                  if (inputPassword == correctPassword) {
                    final updated = channelGroupItem.copyWith(
                        isOpen: !channelGroupItem.isOpen);
                    onUpdate(updated);
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Password incorrect",
                              style: TextStyle(fontSize: 13))),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Confirm",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              const SizedBox(width: 40),
              TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Cancel",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
            ],
          ),
        ],
      ),
    );
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
