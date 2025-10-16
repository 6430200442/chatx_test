import 'dart:convert';
import 'package:cryptography/cryptography.dart';

class KeyManager {
  final algorithm = X25519();
  SimpleKeyPair? _keyPair;
  SimplePublicKey? _publicKey;

  Future<void> generateKeyPair() async {
    _keyPair = await algorithm.newKeyPair();
    _publicKey = await _keyPair!.extractPublicKey();
  }

  Future<String> getPublicKeyBase64() async {
    final rawKey = _publicKey!.bytes;
    return base64Encode(rawKey);
  }

  SimpleKeyPair get keyPair => _keyPair!;
  SimplePublicKey get publicKey => _publicKey!;
}
