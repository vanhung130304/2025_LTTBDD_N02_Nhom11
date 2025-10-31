import 'dart:convert';
import 'package:http/http.dart' as http;

class FlightApiService {
  static Future<List<dynamic>> fetchFlights() async {
    final url = Uri.parse('https://opensky-network.org/api/states/all');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['states'] ?? [];
    } else {
      throw Exception(
        'Lỗi tải dữ liệu chuyến bay (HTTP ${response.statusCode})',
      );
    }
  }
}
