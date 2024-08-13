import 'dart:convert';
import 'package:http/http.dart' as http;

class FreeSlotApiModel {
  static const String baseUrl = 'https://cse-parking.up.railway.app/api/';

  Future<int> fetchFreeSlots() async {
    final response = await http.get(Uri.parse('${baseUrl}freeslots/'));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['free_slots'];
    } else {
      throw Exception('Failed to load free slots');
    }
  }
}
