import 'package:flutter/material.dart';

class CustomerProfile {
  final String chatRoomId; 
  final String customerId;
  final String customerImage;
  final String customerName;
  final String channelName;
  final CustomerDetail customerDetail;
  final String customerNote;
  final List<CustomerTag> customerTags;
  final List<CustomerSentImage> sentImages;

  CustomerProfile ({
    required this.chatRoomId,
    required this.customerId,
    required this.customerImage,
    required this.customerName,
    required this.channelName,
    required this.customerDetail,
    required this.customerNote,
    required this.customerTags,
    required this.sentImages,
    
  });
}

class CustomerDetail {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;

  CustomerDetail({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
  });
}

class CustomerTag {
  final String tagCategoryId;
  final String tagCategoryName;
  final List<ProfileTagLabel> tags;

  CustomerTag({
    required this.tagCategoryId,
    required this.tagCategoryName,
    required this.tags,
  });
}

class ProfileTagLabel {
  final String tagLabelId; 
  final String tagLabelName;
  final Color tagColor;

  ProfileTagLabel ({
    required this.tagLabelId,
    required this.tagLabelName,
    required this.tagColor,
    
  });
}

class CustomerSentImage {
  final String imageId; 
  final String imageUrl;
  final DateTime sentAt;

  CustomerSentImage({
    required this.imageId,
    required this.imageUrl,
    required this.sentAt,
  });
}
