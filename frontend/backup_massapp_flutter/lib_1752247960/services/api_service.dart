import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = 'http://107.174.26.23:5000';

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<List<dynamic>> fetchMateri() async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/api/materi'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load materi');
    }
  }

  static Future<List<dynamic>> fetchProjects(int materiId) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/api/materi/$materiId/projects'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load projects');
    }
  }

  static Future<List<dynamic>> fetchQuizzes(int materiId) async {
    final token = await _getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/api/materi/$materiId/quizzes'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load quizzes');
    }
  }
}
