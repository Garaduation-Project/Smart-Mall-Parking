import 'dart:convert';
import 'package:http/http.dart' as http;

class UserAPI {
  static const String baseUrl = 'https://cse-parking.up.railway.app/api';

  // Fetch user information
  static Future<Map<String, dynamic>> getUserInfo(String token) async {
    final url = Uri.parse('$baseUrl/user/');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return {'success': true, 'data': jsonDecode(response.body)};
    } else {
      return {'success': false, 'error': jsonDecode(response.body)};
    }
  }
}
