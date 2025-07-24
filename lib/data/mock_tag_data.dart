import 'package:flutter/material.dart';
import 'package:chatx_test/model/tag.dart';

final List<Tag> allTags = [
  Tag(
    tagCategoryId: 'tc001',
    tagCategoryName: 'Category A',
    tags: [
      TagLabel(
        tagLabelId: 'tl001',
        tagLabelName: 'Cate A01',
        tagColor: Colors.red,
      ),
      TagLabel(
        tagLabelId: 'tl002',
        tagLabelName: 'Cate A02',
        tagColor: Colors.orange,
      ),
      TagLabel(
        tagLabelId: 'tl003',
        tagLabelName: 'Cate A03',
        tagColor: Colors.brown,
      ),
      TagLabel(
        tagLabelId: 'tl004',
        tagLabelName: 'Cate A04',
        tagColor: Colors.pink,
      ),
    ],
  ),
  Tag(
    tagCategoryId: 'tc002',
    tagCategoryName: 'Category A',
    tags: [
      TagLabel(
        tagLabelId: 'tl001',
        tagLabelName: 'Cate B01',
        tagColor: Colors.green,
      ),
      TagLabel(
        tagLabelId: 'tl002',
        tagLabelName: 'Cate B02',
        tagColor: Colors.grey,
      ),
      TagLabel(
        tagLabelId: 'tl003',
        tagLabelName: 'Cate B03',
        tagColor: Colors.blue,
      ),
      TagLabel(
        tagLabelId: 'tl004',
        tagLabelName: 'Cate B04',
        tagColor: Colors.purple,
      ),
    ],
  ),
];
