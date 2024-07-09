import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginApiModel {
  static final storage = FlutterSecureStorage();

  static Future<String?> login(String email, String password) async {
    final url = Uri.parse('https://cse-parking.up.railway.app/api/login/');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Login successful
      Map<String, dynamic> responseData = jsonDecode(response.body);
      String? token =
          responseData['jwt']; // Assuming 'jwt' is the key for the token

      if (token != null) {
        // Store token securely
        await storage.write(key: 'token', value: token);
        // Print token to console (for demonstration purposes)
        print('Token stored: $token');
        return token;
      } else {
        print('Token not found in response');
        return null;
      }
    } else {
      // Login failed
      print('Failed to login. Status code: ${response.statusCode}');
      return null;
    }
  }

  static Future<String?> getToken() async {
    return await storage.read(key: 'token');
  }

  static Future<void> deleteToken() async {
    await storage.delete(key: 'token');
  }
}
