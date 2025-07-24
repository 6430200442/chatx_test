// import 'package:chatx_test/model/customer_profile.dart';
import 'package:flutter/material.dart';

class Tag {
  final String tagCategoryId;
  final String tagCategoryName;
  final List<TagLabel> tags;

  Tag ({
    required this.tagCategoryId,
    required this.tagCategoryName,
    required this.tags,
  });
}

class TagLabel {
  final String tagLabelId; 
  final String tagLabelName;
  final Color tagColor;

  TagLabel ({
    required this.tagLabelId,
    required this.tagLabelName,
    required this.tagColor,
    
  });
}
