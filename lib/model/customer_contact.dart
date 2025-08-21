import 'package:flutter/material.dart';

class CustomerContact {
  final String customerId;
  final String customerImage;
  final String customerName;
  final String channelName;
  final String channelImage;
  final String customerNote;
  final String? tag;
  final Color? tagColor;
  final String status;
  final Color statusColor;
  final String groupName;
  final List<CustomerTag> customerTags;

  CustomerContact ({
    required this.customerId,
    required this.customerImage,
    required this.customerName,
    required this.channelName,
    required this.channelImage,
    required this.customerNote,
    this.tag,
    this.tagColor,
    required this.status,
    required this.statusColor,
    required this.groupName,
    required this.customerTags,
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
