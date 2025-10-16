import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class KeyExchangeService {
  final String apiUrl =
      'https://api-chatx-owner-dev.cyberpay.tech/api/key-exchange';

  Future<String?> exchangeKeys(String clientPublicKeyBase64) async {
    final sessionId = const Uuid().v4();

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'sessionId': sessionId,
        'clientPublicKey': clientPublicKeyBase64,
      }),
    );

    print('HTTP status: ${response.statusCode}');
    print('HTTP body: ${response.body}');

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return body['data']?['serverPublicKey']; // base64 string
    } else {
      print('Error: ${response.statusCode} ${response.body}');
      return null;
    }
  }
}
