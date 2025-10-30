import 'package:chatx_test/constant/app_constants.dart';
// import 'package:chatx_test/controller/chat_controller.dart';
// import 'package:chatx_test/data/mock_chat_detail_data.dart';
// import 'package:chatx_test/data/mock_customer_profile.dart';
import 'package:chatx_test/model/chat_detail_message.dart';
import 'package:chatx_test/model/customer_profile.dart';
import 'package:chatx_test/widget/close_button.dart';
import 'package:chatx_test/widget/join_chat_dropdown.dart';
import 'package:chatx_test/widget/transfer_button.dart';
import 'package:chatx_test/widget/view_only_button.dart';
import 'package:flutter/material.dart';
import 'package:chatx_test/pages/customer_profile.dart';

class ChatDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ChatDetailMessage chatDetail;
  final CustomerProfile customerProfile;
  final VoidCallback onClosePressed;

  const ChatDetailAppBar({
    super.key,
    required this.chatDetail,
    required this.customerProfile,
    required this.onClosePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.backButton),
      elevation: 0,
      toolbarHeight: 100,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              GestureDetector(
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
                      radius: 20,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chatDetail.customerName,
                          style: const TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                chatDetail.channel,
                              ),
                              radius: 10,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              chatDetail.channelName,
                              style: const TextStyle(
                                fontSize: 14,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          if (chatDetail.status == 'have agent' ||
              chatDetail.status == 'no agent') ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 25,
                    width: 60,
                    child: CloseButtonLabel(
                      onPressed: onClosePressed,
                    ),
                  ),
                  const SizedBox(width: 4),
                  SizedBox(
                      height: 25,
                      width: 80,
                      child: ViewOnlyButton(onPressed: () {})),
                  const SizedBox(width: 4),    
                  SizedBox(
                      height: 25,
                      width: 70,
                      child: TransferButton(onPressed: () {})),
                  const SizedBox(width: 4),    
                  const Expanded(
                    child: SizedBox(
                        height: 25, width: 110, child: JoinChatDropdown()),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
      titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
      backgroundColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
