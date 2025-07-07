import 'package:chatx_test/model/chat_message.dart';
import 'package:flutter/material.dart';

List<ChatMessage> mockChatData = [

  // person 1
  ChatMessage(
    chatRoomId: 'CR001',
    customerId: 'C001',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    lastMessage: 'ขอสอบถามค่ะ',
    time: '21:00 PM',
    unreadCount: 2,
    status: 'no agent',
    statusColor: Colors.red,
    channel: 'assets/imgs/instagram.png',
  ),

  // person 2
  ChatMessage(
    chatRoomId: 'CR002',
    customerId: 'C002',
    customerImage: 'assets/imgs/male1.jpg',
    customerName: 'Ken',
    lastMessage: 'ขอบคุณครับ',
    time: '19:30 PM',
    unreadCount: 0,
    status: 'done',
    statusColor: Colors.grey,
    channel: 'assets/imgs/facebook.png',
  ),

  // person 3
  ChatMessage(
    chatRoomId: 'CR003',
    customerId: 'C003',
    customerImage: 'assets/imgs/female2.jpg',
    customerName: 'Praew',
    lastMessage: 'มีสินค้านี้ไหมคะ',
    time: '18:45 PM',
    unreadCount: 1,
    status: 'have agent',
    statusColor: Colors.orange,
    channel: 'assets/imgs/line.png',
    // agent info
    agentId: 'A001',
    agentImage: 'assets/imgs/agent1.jpg',
    agentName: 'Me',
  ),

  // person 4
  ChatMessage(
    chatRoomId: 'CR004',
    customerId: 'C004',
    customerImage: 'assets/imgs/female3.jpg',
    customerName: 'Sua',
    lastMessage: 'มีโปรโมชันอะไรบ้าง',
    time: '18:00 PM',
    unreadCount: 0,
    status: 'have agent',
    statusColor: Colors.orange,
    channel: 'assets/imgs/wechat.png',
    // agent info
    agentId: 'A003',
    agentImage: 'assets/imgs/agent3.jpg',
    agentName: 'Agent Mook',
  ),

  // person 5
  ChatMessage(
    chatRoomId: 'CR005',
    customerId: 'C005',
    customerImage: 'assets/imgs/female4.jpg',
    customerName: 'Ploy',
    lastMessage: 'ขอบคุณค่ะ',
    time: '17:25 PM',
    unreadCount: 0,
    status: 'Done',
    statusColor: Colors.grey,
    channel: 'assets/imgs/line.png',
  ),

  // person 6
  ChatMessage(
    chatRoomId: 'CR006',
    customerId: 'C006',
    customerImage: 'assets/imgs/female5.jpg',
    customerName: 'Fah',
    lastMessage: 'บริการดีมากค่ะ',
    time: '16:12 PM',
    unreadCount: 1,
    status: 'have agent',
    statusColor: Colors.orange,
    channel: 'assets/imgs/livechat.png',
    // agent info
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),

  // person 7
  ChatMessage(
    chatRoomId: 'CR007',
    customerId: 'C007',
    customerImage: 'assets/imgs/male2.jpg',
    customerName: 'Jack',
    lastMessage: 'โอเคครับ',
    time: '15:15 PM',
    unreadCount: 0,
    status: 'have agent',
    statusColor: Colors.orange,
    channel: 'assets/imgs/facebook.png',
    // agent info
    agentId: 'A003',
    agentImage: 'assets/imgs/agent3.jpg',
    agentName: 'Agent Mook',
  ),

  // person 8
  ChatMessage(
    chatRoomId: 'CR008',
    customerId: 'C008',
    customerImage: 'assets/imgs/male3.jpg',
    customerName: 'Oat',
    lastMessage: 'ครับ',
    time: '14:12 PM',
    unreadCount: 0,
    status: 'Done',
    statusColor: Colors.grey,
    channel: 'assets/imgs/instagram.png',
  ),

  // person 9
  ChatMessage(
    chatRoomId: 'CR009',
    customerId: 'C009',
    customerImage: 'assets/imgs/male4.jpg',
    customerName: 'Tom',
    lastMessage: 'Thank you for your help',
    time: '13:59 PM',
    unreadCount: 0,
    status: 'Done',
    statusColor: Colors.grey,
    channel: 'assets/imgs/livechat.png',
  ),

  // person 10
  ChatMessage(
    chatRoomId: 'CR010',
    customerId: 'C010',
    customerImage: 'assets/imgs/female6.jpg',
    customerName: 'Nok',
    lastMessage: 'ลงทะเบียนสมาชิกได้ที่ไหนคะ',
    time: '12:44 PM',
    unreadCount: 2,
    status: 'no agent',
    statusColor: Colors.red,
    channel: 'assets/imgs/wechat.png',
  ),

  // person 11
  ChatMessage(
    chatRoomId: 'CR011',
    customerId: 'C011',
    customerImage: 'assets/imgs/female7.jpg',
    customerName: 'Ning',
    lastMessage: 'ขอบคุณสำหรับข้อมูลค่ะ',
    time: '11:22 AM',
    unreadCount: 1,
    status: 'done',
    statusColor: Colors.grey,
    channel: 'assets/imgs/line.png',
  ),

  // person 12
  ChatMessage(
    chatRoomId: 'CR012',
    customerId: 'C012',
    customerImage: 'assets/imgs/male5.jpg',
    customerName: 'Nong',
    lastMessage: 'รบกวนช่วยแนะนำสินค้าหน่อยครับ',
    time: '10:43 AM',
    unreadCount: 1,
    status: 'no agent',
    statusColor: Colors.red,
    channel: 'assets/imgs/facebook.png',
  ),

  // person 13
  ChatMessage(
    chatRoomId: 'CR013',
    customerId: 'C013',
    customerImage: 'assets/imgs/female8.jpg',
    customerName: 'Nan',
    lastMessage: 'ขอบคุณที่ช่วยเหลือค่ะ',
    time: '10:40 AM',
    unreadCount: 0,
    status: 'done',
    statusColor: Colors.grey,
    channel: 'assets/imgs/livechat.png',
  ),

  // person 14
  ChatMessage(
    chatRoomId: 'CR014',
    customerId: 'C014',
    customerImage: 'assets/imgs/female9.jpg',
    customerName: 'Ben',
    lastMessage: 'นัดส่งสินค้าได้เมื่อไหร่คะ',
    time: '09:25 AM',
    unreadCount: 0,
    status: 'have agent',
    statusColor: Colors.orange,
    channel: 'assets/imgs/instagram.png',
    // agent info
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),

  // person 15
  ChatMessage(
    chatRoomId: 'CR015',
    customerId: 'C015',
    customerImage: 'assets/imgs/female10.jpg',
    customerName: 'Yui',
    lastMessage: 'หากมีปัญหาสามารถติดต่อได้ที่ไหนคะ',
    time: '8:00 AM',
    unreadCount: 1,
    status: 'have agent',
    statusColor: Colors.orange,
    channel: 'assets/imgs/line.png',
    // agent info
    agentId: 'A001',
    agentImage: 'assets/imgs/agent1.jpg',
    agentName: 'Me',
  ),
];
