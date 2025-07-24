import 'package:chatx_test/widget/customer_profile_avatar.dart';
import 'package:chatx_test/widget/customer_profile_header.dart';
import 'package:chatx_test/widget/customer_profile_note.dart';
import 'package:chatx_test/widget/customer_profile_detail.dart';
import 'package:chatx_test/widget/customer_profile_tag.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/model/chat_detail_message.dart';
// import 'package:chatx_test/model/customer_profile_tag.dart';
import 'package:chatx_test/widget/customer_profile_gallery.dart';

class CustomerProfilePage extends StatefulWidget {
  final ChatDetailMessage customerProfile;
  final ScrollController scrollController;

  const CustomerProfilePage({Key? key, required this.customerProfile, required this.scrollController}) : super(key: key);

  @override
  State<CustomerProfilePage> createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(20)
              ),
          child: ListView(
            controller: widget.scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(
                height: 70,
              ),
              CustomerProfileHeader(profile: widget.customerProfile),
              const CustomerProfileDetail(),
              const CustomerProfileNote(),
              const CustomerProfileTag(),
              const CustomerProfileGallery(),
            ],
          ),
        ),
        Positioned(
          top: -75,
          left: (MediaQuery.of(context).size.width / 2) - 75,
          child: CustomerProfileAvatar(imagePath: widget.customerProfile.customerImage,)
        ),
      ],
    );
  }
}
