import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://your-backend-url.com/api';

  static Future<List<dynamic>> fetchNotes() async {
    final response = await http.get(Uri.parse('$baseUrl/notes/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load notes');
    }
  }

  static Future<List<dynamic>> fetchPyqs() async {
    final response = await http.get(Uri.parse('$baseUrl/pyqs/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load PYQs');
    }
  }

  static Future<List<dynamic>> fetchEvents() async {
    final response = await http.get(Uri.parse('$baseUrl/events/'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load events');
    }
  }

  static Future<bool> uploadNote(String title, String fileUrl) async {
    final response = await http.post(
      Uri.parse('$baseUrl/notes/'),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"title": title, "file_url": fileUrl}),
    );
    return response.statusCode == 201;
  }
}
