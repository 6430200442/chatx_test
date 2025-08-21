import 'package:flutter/material.dart';
import 'package:chatx_test/model/customer_profile.dart';

List<CustomerProfile> mockCustomer = [
  CustomerProfile(
    chatRoomId: 'CR001',
    customerId: 'C001',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 24),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime(2025, 7, 24),
      ),
      CustomerSentImage(
        imageId: 'si003',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 23),
      ),
      CustomerSentImage(
        imageId: 'si004',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 23),
      ),
      CustomerSentImage(
        imageId: 'si005',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 23),
      ),
      CustomerSentImage(
        imageId: 'si006',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 23),
      ),
      CustomerSentImage(
        imageId: 'si007',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 22),
      ),
      CustomerSentImage(
        imageId: 'si008',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 21),
      ),
      CustomerSentImage(
        imageId: 'si009',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 21),
      ),
      CustomerSentImage(
        imageId: 'si010',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime(2025, 7, 21),
      ),
    ],
  ),

//person 2
  CustomerProfile(
    chatRoomId: 'CR002',
    customerId: 'C002',
    customerImage: 'assets/imgs/male1.jpg',
    customerName: 'Ken',
    channelName: 'facebook',
    customerNote: '.....',
    customerDetail: CustomerDetail(
      firstName: 'Ken',
      lastName: 'Park',
      email: 'ken.park@example.com',
      phoneNumber: '082-345-6789',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb002',
            tagLabelName: 'Cate B02',
            tagColor: Colors.grey,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://media.printler.com/media/photo/125232.jpg?rmode=crop&width=638&height=900',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://upload.wikimedia.org/wikipedia/en/5/5f/Original_Doge_meme.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

  //person3
  CustomerProfile(
    chatRoomId: 'CR003',
    customerId: 'C003',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

  //person4
  CustomerProfile(
    chatRoomId: 'CR004',
    customerId: 'C004',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

  //person5
  CustomerProfile(
    chatRoomId: 'CR005',
    customerId: 'C005',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person6
  CustomerProfile(
    chatRoomId: 'CR006',
    customerId: 'C006',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person7
  CustomerProfile(
    chatRoomId: 'CR007',
    customerId: 'C007',
    customerImage: 'assets/imgs/male2.jpg',
    customerName: 'Jack',
    channelName: 'facebook',
    customerNote: '..........',
    customerDetail: CustomerDetail(
      firstName: 'Jack',
      lastName: 'Nathan',
      email: 'Jack.nathan@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si015',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 4)),
      ),
      CustomerSentImage(
        imageId: 'si014',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3113.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      CustomerSentImage(
        imageId: 'si013',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      CustomerSentImage(
        imageId: 'si012',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3113.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      CustomerSentImage(
        imageId: 'si011',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      CustomerSentImage(
        imageId: 'si010',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3113.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      CustomerSentImage(
        imageId: 'si009',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      CustomerSentImage(
        imageId: 'si008',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3113.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      CustomerSentImage(
        imageId: 'si007',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      CustomerSentImage(
        imageId: 'si006',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3113.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      CustomerSentImage(
        imageId: 'si005',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si004',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3113.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si003',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3113.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://img.freepik.com/premium-vector/test-icon-vector-design-templates_1172029-3110.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
  ),

//person8
  CustomerProfile(
    chatRoomId: 'CR008',
    customerId: 'C008',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person9
  CustomerProfile(
    chatRoomId: 'CR009',
    customerId: 'C009',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person10
  CustomerProfile(
    chatRoomId: 'CR010',
    customerId: 'C010',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person11
  CustomerProfile(
    chatRoomId: 'CR011',
    customerId: 'C011',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person12
  CustomerProfile(
    chatRoomId: 'CR012',
    customerId: 'C012',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person13
  CustomerProfile(
    chatRoomId: 'CR013',
    customerId: 'C013',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person14
  CustomerProfile(
    chatRoomId: 'CR014',
    customerId: 'C014',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),

//person15
  CustomerProfile(
    chatRoomId: 'CR015',
    customerId: 'C015',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'instagram',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่ มีแนวโน้มสั่งซื้อสูง',
    customerDetail: CustomerDetail(
      firstName: 'Janejira',
      lastName: 'Smith',
      email: 'Janejira.smith@example.com',
      phoneNumber: '080-123-4567',
    ),
    customerTags: [
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla001',
            tagLabelName: 'Cate A01',
            tagColor: Colors.red,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla002',
            tagLabelName: 'Cate A02',
            tagColor: Colors.orange,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc001',
        tagCategoryName: 'Category A',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tla003',
            tagLabelName: 'Cate A03',
            tagColor: Colors.brown,
          ),
        ],
      ),
      CustomerTag(
        tagCategoryId: 'tc002',
        tagCategoryName: 'Category B',
        tags: [
          ProfileTagLabel(
            tagLabelId: 'tlb001',
            tagLabelName: 'Cate B01',
            tagColor: Colors.green,
          ),
        ],
      ),
    ],
    sentImages: [
      CustomerSentImage(
        imageId: 'si001',
        imageUrl:
            'https://www.cuteness.com/cuteness/17-super-wholesome-dog-memes-to-warm-your-heart/20e09723c51f41b5bebe1fbda21472c9.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      CustomerSentImage(
        imageId: 'si002',
        imageUrl:
            'https://ih1.redbubble.net/image.3127263335.9602/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
        sentAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
    ],
  ),
];
