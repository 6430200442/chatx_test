import 'package:chatx_test/constant/app_constants.dart';
// import 'package:chatx_test/controller/chat_controller.dart';
// import 'package:chatx_test/data/mock_chat_detail_data.dart';
// import 'package:chatx_test/data/mock_customer_profile.dart';
import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:chatx_test/model/customer_profile.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/customer_profile.dart';

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatDetailMessage chatDetail;
  final CustomerProfile customerProfile;

  const ChatDetailAppBar({
    super.key,
    required this.chatDetail,
    required this.customerProfile,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.backButton),
      titleSpacing: 0,
      title: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => DraggableScrollableSheet(
              initialChildSize: 0.7,
              maxChildSize: 0.85,
              builder: (context, scrollController) {
                return CustomerProfilePage(
                  customerHeaderProfile: customerProfile,
                  scrollController: scrollController,
                );
              },
            ),
          );
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(chatDetail.customerImage),
              radius: 18,
            ),
            const SizedBox(width: 12),
            Text(chatDetail.customerName),
          ],
        ),
      ),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
