import 'package:flutter/material.dart';

class TagLabel {
  final String chatRoomId; 
  final String customerId;
  final String customerImage;
  final String customerName;
  final String channelName;
  final String detail;
  final String note;
  final String tagLabelId; 
  final String tagLabelName;
  final Color tagColor;
  final String tagCategoryId;
  final String tagCategoryName;
  final String gallery;  

  TagLabel ({
    required this.chatRoomId,
    required this.customerId,
    required this.customerImage,
    required this.customerName,
    required this.channelName,
    required this.detail,
    required this.note,
    required this.tagLabelId,
    required this.tagLabelName,
    required this.tagColor,
    required this.tagCategoryId,
    required this.tagCategoryName,
    required this.gallery
    
  });
}