// import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/model/customer_profile.dart';

class CustomerProfileHeader extends StatelessWidget {
  final CustomerProfile profile;
  
  const CustomerProfileHeader({Key? key, required this.profile})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: 
        Text(
          '${profile.customerName} - ${profile.channelName}',
          style: const TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold, 
              color: Colors.black),
          textAlign: TextAlign.center,
        ),
    );
  }
}
