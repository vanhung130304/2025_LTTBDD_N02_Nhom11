import 'dart:convert';
import 'package:http/http.dart' as http;

class TravelApiService {
  static const String _baseUrl = 'https://travel-places.p.rapidapi.com/';
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'X-RapidAPI-Key': 'd74e049739msha519ef88ebcde2fp10a123jsn568df6a628e6',
    'X-RapidAPI-Host': 'travel-places.p.rapidapi.com',
  };

  static Future<List<dynamic>> fetchPlaces() async {
    const String query = '''
    {
      getPlaces(
        lat: 16.0471,
        lng: 108.2068,
        maxDistMeters: 30000
      ) {
        name
        lat
        lng
        abstract
        distance
        categories
      }
    }
    ''';

    final response = await http.post(
      Uri.parse('${_baseUrl}'),
      headers: _headers,
      body: json.encode({'query': query}),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final places = jsonBody['data']['getPlaces'];
      return places ?? [];
    } else {
      throw Exception('Không thể tải dữ liệu: ${response.statusCode}');
    }
  }
}
