import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart'; // Import shared_preferences

class LogOutApiModel {
  static Future<Map<String, dynamic>?> getUserDetails() async {
    final response = await http
        .get(Uri.parse('https://cse-parking.up.railway.app/api/logout/'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }

  static Future<bool> logOut() async {
    // Clear user data from shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return true;
  }
}
