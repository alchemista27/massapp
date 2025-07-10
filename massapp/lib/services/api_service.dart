import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://107.174.26.23:5000'; // Ganti ini sesuai backend VPS kamu

  // Fetch Materi List (Dummy)
  static Future<List<dynamic>> fetchMateriList() async {
    final response = await http.get(Uri.parse('http://107.174.26.23/api'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load materi');
    }
  }

  // Login API
  static Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('http://107.174.26.23/api');
    final response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );
    return response;
  }

  // Register API
  static Future<http.Response> register(String email, String password) async {
    final url = Uri.parse('http://107.174.26.23/api');
    final response = await http.post(
      url,
      body: {'email': email, 'password': password},
    );
    return response;
  }

  // Fetch Project List (Dummy)
  static Future<List<dynamic>> fetchProjectList() async {
    final response = await http.get(Uri.parse('http://107.174.26.23/api'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load project list');
    }
  }

  // Fetch Project Detail (Dummy)
  static Future<Map<String, dynamic>> fetchProjectDetail(String id) async {
    final response = await http.get(Uri.parse('http://107.174.26.23/api'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load project detail');
    }
  }

  // Submit Materi
  static Future<http.Response> submitMateri({
    required String title,
    required String description,
    required String videoUrl,
    required String pdfUrl,
  }) async {
    final url = Uri.parse('http://107.174.26.23/api');
    final response = await http.post(
      url,
      body: {
        'title': title,
        'description': description,
        'video_url': videoUrl,
        'pdf_url': pdfUrl,
      },
    );
    return response;
  }

  // Submit Project
  static Future<http.Response> submitProject({
    required String userId,
    required String materiId,
    required String fileUrl,
  }) async {
    final url = Uri.parse('http://107.174.26.23/api');
    final response = await http.post(
      url,
      body: {
        'user_id': userId,
        'materi_id': materiId,
        'file_url': fileUrl,
      },
    );
    return response;
  }

// Fetch MateriDetail
static Future<Map<String, dynamic>> fetchMateriDetail(String id) async {
    final response = await http.get(Uri.parse('http://107.174.26.23/api'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load materi detail');
    }
  }
}
