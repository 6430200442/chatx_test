import 'package:chatx_test/model/chat_detail_message.dart';
//import 'package:flutter/material.dart';

List<ChatDetailMessage> mockChatDetailData = [

  /*----------------------------------------------------- */
  // person 1
  ChatDetailMessage(
    chatRoomId: 'CR001',
    customerId: 'C001',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    messageId: 'M002',
    message: 'ขอสอบถามค่ะ',
    time: DateTime.parse('2023-10-01 21:00:00'),
    isSender: false,
    isRead: true,
    status: 'no agent',
    channel: 'assets/imgs/instagram.png',
  ),

  ChatDetailMessage(
    chatRoomId: 'CR001',
    customerId: 'C001',
    customerImage: 'assets/imgs/female1.jpg',
    customerName: 'Janejira',
    messageId: 'M001',
    message: 'สวัสดีค่ะ',
    time: DateTime.parse('2023-10-01 20:59:00'),
    isSender: false,
    isRead: true,
    status: 'no agent',
    channel: 'assets/imgs/instagram.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 2
  ChatDetailMessage(
    chatRoomId: 'CR002',
    customerId: 'C002',
    customerImage: 'assets/imgs/male1.jpg',
    customerName: 'Ken',
    messageId: 'M003',
    message: 'ขอบคุณครับ',
    time: DateTime.parse('2023-10-01 19:30:00'),
    isSender: false,
    isRead: true,
    status: 'done',
    channel: 'assets/imgs/facebook.png',
  ),

  ChatDetailMessage(
    chatRoomId: 'CR002',
    customerId: 'C002',
    customerImage: 'assets/imgs/male1.jpg',
    customerName: 'Ken',
    messageId: 'M002',
    message: 'ประกันสินค้า 3 ปีครับ',
    time: DateTime.parse('2023-10-01 19:29:00'),
    isSender: true,
    isRead: true,
    status: 'done',
    channel: 'assets/imgs/facebook.png',
    agentId: 'A001',
    agentImage: 'assets/imgs/agent1.jpg',
    agentName: 'Me',
  ),

  ChatDetailMessage(
    chatRoomId: 'CR002',
    customerId: 'C002',
    customerImage: 'assets/imgs/male1.jpg',
    customerName: 'Ken',
    messageId: 'M001',
    message: 'มีประกันสินค้าไหมครับ',
    time: DateTime.parse('2023-10-01 19:28:00'),
    isSender: false,
    isRead: true,
    status: 'done',
    channel: 'assets/imgs/facebook.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 3
  ChatDetailMessage(
    chatRoomId: 'CR003',
    customerId: 'C003',
    customerImage: 'assets/imgs/female2.jpg',
    customerName: 'Praew',
    messageId: 'M003',
    message: 'มีสินค้านี้ไหมคะ',
    time: DateTime.parse('2023-10-01 18:45:00'),
    isSender: false,
    isRead: false,
    status: 'have agent',
    channel: 'assets/imgs/line.png',
    // agent info
    agentId: 'A001',
    agentImage: 'assets/imgs/agent1.jpg',
    agentName: 'Me',
  ),

  ChatDetailMessage(
    chatRoomId: 'CR003',
    customerId: 'C003',
    customerImage: 'assets/imgs/female2.jpg',
    customerName: 'Praew',
    messageId: 'M002',
    message: 'สอบถามได้ครับ',
    time: DateTime.parse('2023-10-01 18:44:30'),
    isSender: true,
    isRead: false,
    status: 'have agent',
    channel: 'assets/imgs/line.png',
    // agent info
    agentId: 'A001',
    agentImage: 'assets/imgs/agent1.jpg',
    agentName: 'Me',
  ),

  ChatDetailMessage(
    chatRoomId: 'CR003',
    customerId: 'C003',
    customerImage: 'assets/imgs/female2.jpg',
    customerName: 'Praew',
    messageId: 'M001',
    message: 'สวัสดีค่ะ',
    time: DateTime.parse('2023-10-01 18:44:00'),
    isSender: false,
    isRead: false,
    status: 'have agent',
    channel: 'assets/imgs/line.png',
    // agent info
    agentId: 'A001',
    agentImage: 'assets/imgs/agent1.jpg',
    agentName: 'Me',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 4
  ChatDetailMessage(
    chatRoomId: 'CR004',
    customerId: 'C004',
    customerImage: 'assets/imgs/female3.jpg',
    customerName: 'Sua',
    messageId: 'M004',
    message: 'มีโปรโมชันอะไรบ้าง',
    time: DateTime.parse('2023-10-01 18:00:00'),
    isSender: false,
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/wechat.png',
    // agent info
    agentId: 'A003',
    agentImage: 'assets/imgs/agent3.jpg',
    agentName: 'Agent Mook',
  ),
  ChatDetailMessage(
    chatRoomId: 'CR004',
    customerId: 'C004',
    customerImage: 'assets/imgs/female3.jpg',
    customerName: 'Sua',
    messageId: 'M004',
    message: 'ยินดีให้บริการค่ะ',
    time: DateTime.parse('2023-10-01 17:59:00'),
    isSender: true,
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/wechat.png',
    // agent info
    agentId: 'A003',
    agentImage: 'assets/imgs/agent3.jpg',
    agentName: 'Agent Mook',
  ),
  ChatDetailMessage(
    chatRoomId: 'CR004',
    customerId: 'C004',
    customerImage: 'assets/imgs/female3.jpg',
    customerName: 'Sua',
    messageId: 'M004',
    message: 'สวัสดี',
    time: DateTime.parse('2023-10-01 17:58:00'),
    isSender: false,
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/wechat.png',
    // agent info
    agentId: 'A003',
    agentImage: 'assets/imgs/agent3.jpg',
    agentName: 'Agent Mook',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 5
  ChatDetailMessage(
    chatRoomId: 'CR005',
    customerId: 'C005',
    customerImage: 'assets/imgs/female4.jpg',
    customerName: 'Ploy',
    messageId: 'M004',
    message: 'ขอบคุณค่ะ',
    time: DateTime.parse('2023-10-01 17:30:00'),
    isSender: false,
    isRead: false,
    status: 'done',
    channel: 'assets/imgs/line.png',
  ),
  ChatDetailMessage(
    chatRoomId: 'CR005',
    customerId: 'C005',
    customerImage: 'assets/imgs/female4.jpg',
    customerName: 'Ploy',
    messageId: 'M005',
    message: 'ตัดรอบส่งวันนี้ 14.00 น. ค่ะ',
    time: DateTime.parse('2023-10-01 17:29:50'),
    isSender: true,
    isRead: false,
    status: 'done',
    channel: 'assets/imgs/line.png',
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),
  ChatDetailMessage(
    chatRoomId: 'CR005',
    customerId: 'C005',
    customerImage: 'assets/imgs/female4.jpg',
    customerName: 'Ploy',
    messageId: 'M003',
    message: 'จัดส่งสินค้าวันนี้เลยไหมคะ',
    time: DateTime.parse('2023-10-01 17:29:00'),
    isSender: false,
    isRead: false,
    status: 'done',
    channel: 'assets/imgs/line.png',
  ),
  ChatDetailMessage(
    chatRoomId: 'CR005',
    customerId: 'C005',
    customerImage: 'assets/imgs/female4.jpg',
    customerName: 'Ploy',
    messageId: 'M002',
    message: 'ขอขอบคุณที่สนใจ [ชื่อผลิตภัณฑ์] เราได้รับคำถามของคุณแล้วและจะตอบกลับภายใน [กรอบเวลา] พร้อมรายละเอียดเพิ่มเติม ในระหว่างนี้ โปรดดู [คำถามที่พบบ่อยเกี่ยวกับผลิตภัณฑ์] เพื่อดูข้อมูลเพิ่มเติม',
    time: DateTime.parse('2023-10-01 17:28:00'),
    isSender: true,
    isRead: false,
    status: 'done',
    channel: 'assets/imgs/line.png',
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),
  ChatDetailMessage(
    chatRoomId: 'CR005',
    customerId: 'C005',
    customerImage: 'assets/imgs/female4.jpg',
    customerName: 'Ploy',
    messageId: 'M001',
    message: 'สวัสดีค่ะ',
    time: DateTime.parse('2023-10-01 17:27:00'),
    isSender: false,
    isRead: false,
    status: 'done',
    channel: 'assets/imgs/line.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 6 - fah
  ChatDetailMessage(
    chatRoomId: 'CR006',
    customerId: 'C006',
    customerImage: 'assets/imgs/female5.jpg',
    customerName: 'Fah',
    messageId: 'M005',
    message: 'บริการดีมากค่ะ',
    time: DateTime.parse('2023-10-01 16:12:00'),
    isSender: false,
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/livechat.png',
    // agent info
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),
  // ข้อความ 2: Agent Anna ตอบกลับ
  ChatDetailMessage(
    chatRoomId: 'CR006',
    customerId: 'C006',
    customerImage: 'assets/imgs/female5.jpg',
    customerName: 'Fah',
    messageId: 'M004',
    message: '2-3 วันตามวันเวลาราชการค่ะ',
    time: DateTime.parse('2023-10-01 16:11:00'),
    isSender: true, // Agent
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/livechat.png',
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),

// ข้อความ 3: ลูกค้า Fah ส่งข้อความอีก
  ChatDetailMessage(
    chatRoomId: 'CR006',
    customerId: 'C006',
    customerImage: 'assets/imgs/female5.jpg',
    customerName: 'Fah',
    messageId: 'M003',
    message: 'ระยะเวลาในการจัดส่งสินค้าใช้เวลากี่วันคะ',
    time: DateTime.parse('2023-10-01 16:10:00'),
    isSender: false, // ลูกค้า
    isRead: false,
    status: 'have agent',
    channel: 'assets/imgs/livechat.png',
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),

// ข้อความ 4: Agent Anna ตอบกลับ
  ChatDetailMessage(
    chatRoomId: 'CR006',
    customerId: 'C006',
    customerImage: 'assets/imgs/female5.jpg',
    customerName: 'Fah',
    messageId: 'M002',
    message: 'ยินดีให้บริการ เชิญสอบถามได้เลยค่ะ',
    time: DateTime.parse('2023-10-01 16:09:00'),
    isSender: true, // Agent
    isRead: false,
    status: 'have agent',
    channel: 'assets/imgs/livechat.png',
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),
  // ข้อความ 3: ลูกค้า Fah ส่งข้อความอีก
  ChatDetailMessage(
    chatRoomId: 'CR006',
    customerId: 'C006',
    customerImage: 'assets/imgs/female5.jpg',
    customerName: 'Fah',
    messageId: 'M001',
    message: 'สวัสดีค่ะ',
    time: DateTime.parse('2023-10-01 16:08:00'),
    isSender: false, // ลูกค้า
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/livechat.png',
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------------- */
  // person 7
  ChatDetailMessage(
    chatRoomId: 'CR007',
    customerId: 'C007',
    customerImage: 'assets/imgs/male2.jpg',
    customerName: 'Jack',
    messageId: 'M007',
    message: 'โอเคครับ',
    time: DateTime.parse('2023-10-01 15:15:00'),
    isSender: false,
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/facebook.png',
    // agent info
    agentId: 'A003',
    agentImage: 'assets/imgs/agent3.jpg',
    agentName: 'Agent Mook',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 8
  ChatDetailMessage(
    chatRoomId: 'CR008',
    customerId: 'C008',
    customerImage: 'assets/imgs/male3.jpg',
    customerName: 'Oat',
    messageId: 'M008',
    message: 'ครับ',
    time: DateTime.parse('2023-10-01 14:12:00'),
    isSender: false,
    isRead: false,
    status: 'Done',
    channel: 'assets/imgs/instagram.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 9
  ChatDetailMessage(
    chatRoomId: 'CR009',
    customerId: 'C009',
    customerImage: 'assets/imgs/male4.jpg',
    customerName: 'Tom',
    messageId: 'M009',
    message: 'Thank you for your help',
    time: DateTime.parse('2023-10-01 13:59:00'),
    isSender: false,
    isRead: true,
    status: 'done',
    channel: 'assets/imgs/livechat.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 10
  ChatDetailMessage(
    chatRoomId: 'CR010',
    customerId: 'C010',
    customerImage: 'assets/imgs/female6.jpg',
    customerName: 'Nok',
    messageId: 'M010',
    message: 'ลงทะเบียนสมาชิกได้ที่ไหนคะ',
    time: DateTime.parse('2023-10-01 12:44:00'),
    isSender: false,
    isRead: false,
    status: 'no agent',
    channel: 'assets/imgs/wechat.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 11
  ChatDetailMessage(
    chatRoomId: 'CR011',
    customerId: 'C011',
    customerImage: 'assets/imgs/female7.jpg',
    customerName: 'Ning',
    messageId: 'M011',
    message: 'ขอบคุณสำหรับข้อมูลค่ะ',
    time: DateTime.parse('2023-10-01 11:22:00'),
    isSender: false,
    isRead: true,
    status: 'done',
    channel: 'assets/imgs/line.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 12
  ChatDetailMessage(
    chatRoomId: 'CR012',
    customerId: 'C012',
    customerImage: 'assets/imgs/male5.jpg',
    customerName: 'Nong',
    messageId: 'M012',
    message: 'รบกวนช่วยแนะนำสินค้าหน่อยครับ',
    time: DateTime.parse('2023-10-01 10:43:00'),
    isSender: false,
    isRead: false,
    status: 'no agent',
    channel: 'assets/imgs/facebook.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 13
  ChatDetailMessage(
    chatRoomId: 'CR013',
    customerId: 'C013',
    customerImage: 'assets/imgs/female8.jpg',
    customerName: 'Nan',
    messageId: 'M013',
    message: 'ขอบคุณที่ช่วยเหลือค่ะ',
    time: DateTime.parse('2023-10-01 10:40:00'),
    isSender: false,
    isRead: true,
    status: 'done',
    channel: 'assets/imgs/livechat.png',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 14
  ChatDetailMessage(
    chatRoomId: 'CR014',
    customerId: 'C014',
    customerImage: 'assets/imgs/female9.jpg',
    customerName: 'Ben',
    messageId: 'M014',
    message: 'นัดส่งสินค้าได้เมื่อไหร่คะ',
    time: DateTime.parse('2023-10-01 09:25:00'),
    isSender: false,
    isRead: false,
    status: 'have agent',
    channel: 'assets/imgs/instagram.png',
    // agent info
    agentId: 'A002',
    agentImage: 'assets/imgs/agent2.jpg',
    agentName: 'Agent Anna',
  ),
  /*----------------------------------------------------- */

  /*----------------------------------------------------- */
  // person 15
  ChatDetailMessage(
    chatRoomId: 'CR015',
    customerId: 'C015',
    customerImage: 'assets/imgs/female10.jpg',
    customerName: 'Yui',
    messageId: 'M015',
    message: 'หากมีปัญหาสามารถติดต่อได้ที่ไหนคะ',
    time: DateTime.parse('2023-10-01 08:00:00'),
    isSender: false,
    isRead: true,
    status: 'have agent',
    channel: 'assets/imgs/line.png',
    // agent info
    agentId: 'A001',
    agentImage: 'assets/imgs/agent1.jpg',
    agentName: 'Me',
  ),
  /*----------------------------------------------------- */
  
];
