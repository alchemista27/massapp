import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://107.174.26.23:5000/api';
  static String? token;

  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      token = data['token'];
      return true;
    } else {
      return false;
    }
  }

  static Future<List<dynamic>> fetchMateri() async {
    final response = await http.get(
      Uri.parse('$baseUrl/materi'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> fetchProjects(int materiId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/materi/$materiId/projects'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> fetchQuizzes(int materiId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/materi/$materiId/quizzes'),
      headers: {'Authorization': 'Bearer $token'},
    );
    return jsonDecode(response.body);
  }

  static Future<double> fetchProgress() async {
    // Dummy progress sementara
    return 0.5;
  }
}
