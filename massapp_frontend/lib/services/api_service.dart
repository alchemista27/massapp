import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://107.174.26.23:5000';

  static Future<http.Response> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return response;
  }

  static Future<http.Response> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return response;
  }

  static Future<http.Response> submitMateri({
    required String title,
    required String description,
    required String videoUrl,
    required String pdfUrl,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/materi'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'description': description,
        'videoUrl': videoUrl,
        'pdfUrl': pdfUrl,
      }),
    );
    return response;
  }

  static Future<List<dynamic>> fetchProjectList() async {
    final response = await http.get(Uri.parse('$baseUrl/project'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal mengambil daftar project.');
    }
  }

  static Future<Map<String, dynamic>> fetchProjectDetail(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/project/$id'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal mengambil detail project.');
    }
  }

  static Future<http.Response> submitProject({
    required String userId,
    required String materiId,
    required String fileUrl,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/project'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userId': userId,
        'materiId': materiId,
        'fileUrl': fileUrl,
      }),
    );
    return response;
  }
}
