import 'package:flutter/material.dart';
import 'package:chatx_test/model/customer_contact.dart';

List<CustomerContact> mockCustomerContact = [
  CustomerContact(
    customerId: 'C001',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    channelName: 'Instagram',
    channelImage: 'assets/imgs/instagram.png',
    customerNote: '......',
    status: 'no agent',
    statusColor: Colors.red,
    groupName: 'Group XXX',
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
  ),

//person 2
  CustomerContact(
    customerId: 'C002',
    customerImage: 'assets/imgs/male1.jpg',
    customerName: 'Ken',
    channelName: 'Facebook',
    channelImage: 'assets/imgs/facebook.png',
    customerNote: 'Bankok, Lat Phrao',
    status: 'done',
    statusColor: Colors.grey,
    groupName: 'Group YZX',
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
  ),

  //person3
  CustomerContact(
    customerId: 'C003',
    customerImage: 'assets/imgs/female2.jpg',
    customerName: 'Praew',
    channelName: 'Line',
    channelImage: 'assets/imgs/line.png',
    customerNote: 'Bankok, Chatuchak',
    tagColor: Colors.brown,
    tag: 'track',
    status: 'have agent',
    statusColor: Colors.orange,
    groupName: 'Group XXX',
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
  ),

  //person4
  CustomerContact(
    customerId: 'C004',
    customerImage: 'assets/imgs/female3.jpg',
    customerName: 'Sua',
    channelName: 'WeChat',
    channelImage: 'assets/imgs/wechat.png',
    customerNote: 'Chonburi, Sriracha',
    tagColor: Colors.brown,
    tag: 'track',
    status: 'have agent',
    statusColor: Colors.orange,
    groupName: 'Group YZX',
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
  ),

  //person5
  CustomerContact(
    customerId: 'C005',
    customerImage: 'assets/imgs/female4.jpg',
    customerName: 'Ploy',
    channelName: 'Line',
    channelImage: 'assets/imgs/line.png',
    customerNote: 'Order: AA789123',
    tagColor: Colors.green,
    tag: 'refund',
    status: 'Done',
    statusColor: Colors.grey,
    groupName: 'Group XXX',
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
  ),

//person6
  CustomerContact(
    customerId: 'C006',
    customerImage: 'assets/imgs/female5.jpg',
    customerName: 'Fah',
    channelName: 'LiveChat',
    channelImage: 'assets/imgs/livechat.png',
    customerNote: 'ลูกค้าสนใจสินค้าชุดใหม่',
    status: 'have agent',
    statusColor: Colors.orange,
    groupName: 'Group XYZ',
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
  ),

//person7
  CustomerContact(
    customerId: 'C007',
    customerImage: 'assets/imgs/male2.jpg',
    customerName: 'Jack',
    channelName: 'Facebook',
    channelImage: 'assets/imgs/facebook.png',
    customerNote: 'Chonburi, Sriracha',
    tagColor: Colors.brown,
    tag: 'track',
    status: 'have agent',
    statusColor: Colors.orange,
    groupName: 'Group XXX',
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
  ),

//person8
  CustomerContact(
    customerId: 'C008',
    customerImage: 'assets/imgs/male3.jpg',
    customerName: 'Oat',
    channelName: 'Instagram',
    channelImage: 'assets/imgs/instagram.png',
    customerNote: 'Order: AC456321',
    status: 'Done',
    statusColor: Colors.grey,
    groupName: 'Group XYZ',
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
  ),

//person9
  CustomerContact(
    customerId: 'C009',
    customerImage: 'assets/imgs/male4.jpg',
    customerName: 'Tom',
    channelName: 'LiveChat',
    channelImage: 'assets/imgs/livechat.png',
    customerNote: 'Order: AF987654',
    tagColor: Colors.green,
    tag: 'refund',
    status: 'Done',
    statusColor: Colors.grey,
    groupName: 'Group XXX',
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
  ),

//person10
  CustomerContact(
    customerId: 'C010',
    customerImage: 'assets/imgs/female6.jpg',
    customerName: 'Nok',
    channelName: 'WeChat',
    channelImage: 'assets/imgs/wechat.png',
    customerNote: '......',
    status: 'no agent',
    statusColor: Colors.red,
    groupName: 'Group XYZ',
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
  ),

//person11
  CustomerContact(
    customerId: 'C011',
    customerImage: 'assets/imgs/female7.jpg',
    customerName: 'Ning',
    channelName: 'Line',
    channelImage: 'assets/imgs/line.png',
    customerNote: 'ของแถม',
    status: 'done',
    statusColor: Colors.grey,
    groupName: 'Group XXX',
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
  ),

//person12
  CustomerContact(
    customerId: 'C012',
    customerImage: 'assets/imgs/male5.jpg',
    customerName: 'Nong',
    channelName: 'Facebook',
    channelImage: 'assets/imgs/facebook.png',
    customerNote: '......',
    status: 'no agent',
    statusColor: Colors.red,
    groupName: 'Group YZX',
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
  ),

//person13
  CustomerContact(
    customerId: 'C013',
    customerImage: 'assets/imgs/female8.jpg',
    customerName: 'Nan',
    channelName: 'LiveChat',
    channelImage: 'assets/imgs/livechat.png',
    customerNote: 'เปลี่ยนสินค้า',
    status: 'done',
    statusColor: Colors.grey,
    groupName: 'Group XXX',
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
  ),

//person14
  CustomerContact(
    customerId: 'C014',
    customerImage: 'assets/imgs/female9.jpg',
    customerName: 'Ben',
    channelName: 'Instagram',
    channelImage: 'assets/imgs/instagram.png',
    customerNote: 'Order: AB123456',
    tag: 'refund',
    tagColor: Colors.green,
    status: 'have agent',
    statusColor: Colors.orange,
    groupName: 'Group XYZ',
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
  ),

//person15
  CustomerContact(
    customerId: 'C015',
    customerImage: 'assets/imgs/female10.jpg',
    customerName: 'Yui',
    channelName: 'Line',
    channelImage: 'assets/imgs/line.png',
    customerNote: 'Nonttaburi, Pakkret',
    tagColor: Colors.brown,
    tag: 'track',
    status: 'have agent',
    statusColor: Colors.orange,
    groupName: 'Group XXX',
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
  ),
];
