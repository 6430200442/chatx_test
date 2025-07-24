import 'package:flutter/material.dart';

class TagLabel {
  final String tagLabelId; 
  final String tagLabelName;
  final Color tagColor;
  final String tagCategoryId;
  final String tagCategoryName; 

  TagLabel ({
    required this.tagLabelId,
    required this.tagLabelName,
    required this.tagColor,
    required this.tagCategoryId,
    required this.tagCategoryName,
    
  });
}