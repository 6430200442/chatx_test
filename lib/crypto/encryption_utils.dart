// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:cryptography/cryptography.dart';

// Future<List<int>> deriveSharedKey(
//     SimpleKeyPair clientKeyPair, String serverPublicKeyBase64) async {
  
//   // ตรวจสอบค่าก่อน
//   if (clientKeyPair == null) {
//     throw ArgumentError('❌ Client key pair is null');
//   }
  
//   // ตรวจสอบ input
//   if (serverPublicKeyBase64.isEmpty) {
//     throw ArgumentError('❌ Server public key (base64) is empty');
//   }

//   // แปลง server public key
//   final rawServerKey = base64Decode(serverPublicKeyBase64);
//   if (rawServerKey.isEmpty) {
//     throw ArgumentError('❌ Server public key bytes are empty after decode');
//   }

//   print('Decoded server key length: ${rawServerKey.length}');
//   print('Decoded server key bytes: $rawServerKey');

//   final algorithm = X25519();

//   // แปลง server public key
//   final serverPublicKey = SimplePublicKey(
//     rawServerKey,
//     type: KeyPairType.x25519,
//   );

//   // สร้าง shared secret
//   final sharedSecret = await algorithm.sharedSecretKey(
//     keyPair: clientKeyPair,
//     remotePublicKey: serverPublicKey,
//   );

//   print('sharedSecret runtimeType: ${sharedSecret.runtimeType}');

//   // 1. ดึง bytes ดิบออกจาก sharedSecret ที่ได้จาก X25519 ก่อน
//   final secretBytes = await sharedSecret.extractBytes();
//   print('sharedSecret bytes length: ${secretBytes.length}');
//   print('sharedSecret bytes: $secretBytes');

//   // 2. สร้าง SecretKey object ใหม่จาก bytes ที่ได้มา สำหรับใช้กับ HKDF โดยเฉพาะ
//   final secretKeyForHkdf = SecretKey(secretBytes);

//   print('🟢🟢🟢 USING NEW CODE! The secretKeyForHkdf object is ready. 🟢🟢🟢');

//   // สร้าง HKDF derived key 
//   final hkdf = Hkdf(
//     hmac: Hmac.sha256(),
//     outputLength: 32,
//   );

//   // final derivedKey = await hkdf.deriveKey(
//   //   // 3. ใช้ SecretKey ที่สร้างขึ้นใหม่ส่งเข้าไปแทน
//   //   secretKey: secretKeyForHkdf, // ✅ แก้ไขตรงนี้
//   //   info: utf8.encode('key-exchange'),
//   // );

//   // ✅ ท่าใหม่: ทำแบบ 2 ขั้นตอน (Extract -> Expand)
//   // ขั้นตอนที่ 1: Extract a pseudorandom key (PRK) from the shared secret.
//   // เราไม่ได้ใช้ "salt" ในขั้นตอนนี้ ซึ่งเป็นเรื่องปกติสำหรับ HKDF
//   final pseudoRandomKey = await hkdf.extract(
//     secretKey: secretKeyForHkdf,
//   );

//   // ขั้นตอนที่ 2: Expand the PRK to get the final output key.
//   final derivedKey = await hkdf.expand(
//     pseudoRandomKey: pseudoRandomKey,
//     info: utf8.encode('key-exchange'),
//   );

//   final derivedBytes = await derivedKey.extractBytes();
//   print('✅ Derived key length: ${derivedBytes.length}');
//   print('✅ Derived key bytes: $derivedBytes');

//   return derivedBytes;
// }

import 'dart:convert';
import 'dart:typed_data'; // ต้อง import เพิ่ม
import 'package:cryptography/cryptography.dart';

Future<List<int>> deriveSharedKey(
    SimpleKeyPair clientKeyPair, String serverPublicKeyBase64) async {
  // --- ส่วนของการแลกเปลี่ยนกุญแจ (เหมือนเดิม) ---

  if (serverPublicKeyBase64.isEmpty) {
    throw ArgumentError('❌ Server public key (base64) is empty');
  }
  final rawServerKey = base64Decode(serverPublicKeyBase64);
  if (rawServerKey.isEmpty) {
    throw ArgumentError('❌ Server public key bytes are empty after decode');
  }

  final algorithm = X25519();
  final serverPublicKey = SimplePublicKey(
    rawServerKey,
    type: KeyPairType.x25519,
  );

  final sharedSecret = await algorithm.sharedSecretKey(
    keyPair: clientKeyPair,
    remotePublicKey: serverPublicKey,
  );

  // --- ส่วนของ HKDF ที่เขียนขึ้นมาใหม่สำหรับ v2.7.0 ---

  print('🟢🟢🟢 Using Manual HKDF for cryptography v2.7.0 🟢🟢🟢');

  final hmac = Hmac.sha256();

  // 1. HKDF-Extract: สร้าง Pseudorandom Key (PRK)
  // ใน v2.7.0 เราจะใช้ sharedSecret เป็น key สำหรับ HMAC โดยตรง
  // (ปกติขั้นตอนนี้จะมี salt แต่ในเคสนี้เราไม่มี salt ซึ่งก็ใช้ได้)
  final prkMac = await hmac.calculateMac(
    [], // ข้อมูลที่ใช้คำนวณ (ว่างเปล่า)
    secretKey: sharedSecret,
  );
  final pseudoRandomKey = SecretKey(prkMac.bytes);

  // 2. HKDF-Expand: สร้าง Output Keying Material (OKM)
  // เราจะใช้ PRK ที่ได้มาเป็น key สำหรับ HMAC ในขั้นตอนนี้
  final info = utf8.encode('key-exchange');
  final counter = [0x01]; // ตัวนับสำหรับรอบแรก
  
  // สร้างข้อมูลที่จะ HMAC = info + counter
  final dataToMac = Uint8List.fromList([...info, ...counter]);

  final okmMac = await hmac.calculateMac(
    dataToMac,
    secretKey: pseudoRandomKey,
  );

  // ผลลัพธ์ที่ได้คือ derived key ที่เราต้องการ
  final derivedBytes = okmMac.bytes;
  
  print('✅ Derived key (manual) length: ${derivedBytes.length}');
  print('✅ Derived key (manual) bytes: $derivedBytes');

  return derivedBytes;
}