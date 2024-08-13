import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:parking/models/login_api_model.dart';

class ReservationApiModel {
  static final storage = FlutterSecureStorage();

  // Function to reserve a slot and store the reservation code
  static Future<Map<String, dynamic>> reserveSlot() async {
    String? token = await LoginApiModel.getToken();
    if (token == null) {
      print('Token not found. Please login first.');
      return {'success': false, 'code': null};
    }

    final url = Uri.parse('https://cse-parking.up.railway.app/api/reserve/');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Cookie': 'jwt=$token',
      },
    );

    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String reservationCode = responseData['reservation_code'];
      await storage.write(key: 'reservation_code', value: reservationCode);
      print('Reservation successful. Code: $reservationCode');
      return {'success': true, 'code': reservationCode};
    } else {
      print('Failed to reserve slot. Status code: ${response.statusCode}');
      return {'success': false, 'code': null};
    }
  }

  // Function to retrieve the saved reservation code
  static Future<String?> getReservationCode() async {
    return await storage.read(key: 'reservation_code');
  }

  // Function to delete the saved reservation code
  static Future<void> deleteReservationCode() async {
    await storage.delete(key: 'reservation_code');
  }
}
