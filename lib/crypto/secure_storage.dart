import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const _storage = FlutterSecureStorage();
  static const _keyDerived = 'derived_key';

  static Future<void> saveDerivedKey(String base64Key) async {
    await _storage.write(key: _keyDerived, value: base64Key);
  }

  static Future<String?> getDerivedKey() async {
    return await _storage.read(key: _keyDerived);
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
