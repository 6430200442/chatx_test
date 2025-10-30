import 'package:chatx_test/model/customer_profile.dart';
import 'package:chatx_test/widget/customer_profile_avatar.dart';
import 'package:chatx_test/widget/customer_profile_header.dart';
import 'package:chatx_test/widget/customer_profile_note.dart';
import 'package:chatx_test/widget/customer_profile_detail.dart';
import 'package:chatx_test/widget/customer_profile_tag.dart';
import 'package:flutter/material.dart';
// import 'package:chatx_test/model/chat_detail_message.dart';
// import 'package:chatx_test/model/customer_profile.dart';
import 'package:chatx_test/widget/customer_profile_gallery.dart';

class CustomerProfilePage extends StatefulWidget {
  final CustomerProfile customerHeaderProfile;

  final ScrollController scrollController;

  const CustomerProfilePage({Key? key, required this.customerHeaderProfile, required this.scrollController}) : super(key: key);

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
                height: 50,
              ),
              CustomerProfileHeader(profile: widget.customerHeaderProfile),
              CustomerProfileDetail(profile: widget.customerHeaderProfile),
              CustomerProfileTag(profile: widget.customerHeaderProfile),
              CustomerProfileNote(profile: widget.customerHeaderProfile),
              const SizedBox(
                height: 10,
              ),
              CustomerProfileGallery(profile: widget.customerHeaderProfile),
            ],
          ),
        ),
        Positioned(
          top: -65,
          left: (MediaQuery.of(context).size.width / 2) - 60,
          child: CustomerProfileAvatar(imagePath: widget.customerHeaderProfile.customerImage,)
        ),
      ],
    );
  }
}
