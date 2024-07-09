import 'dart:convert';
import 'package:http/http.dart' as http;

class PasswordResetAPI {
  static const String baseUrl =
      'https://cse-parking.up.railway.app/api'; // Replace with your backend URL

  // Request password reset
  static Future<Map<String, dynamic>> requestPasswordReset(String email) async {
    final url = Uri.parse('$baseUrl/password-reset-request/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return {'success': true, 'message': jsonDecode(response.body)['message']};
    } else {
      return {'success': false, 'error': jsonDecode(response.body)};
    }
  }

  // Reset password
  static Future<Map<String, dynamic>> resetPassword(
      String resetToken, String newPassword) async {
    final url = Uri.parse('$baseUrl/password-reset/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body:
          jsonEncode({'reset_token': resetToken, 'new_password': newPassword}),
    );

    if (response.statusCode == 200) {
      return {'success': true, 'message': jsonDecode(response.body)['message']};
    } else {
      return {'success': false, 'error': jsonDecode(response.body)};
    }
  }
}
