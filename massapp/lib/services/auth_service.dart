import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String apiUrl = 'http://107.174.26.23/api';

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"email": email, "password": password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Login failed');
    }
  }

  static Future<void> register(String fullName, String id, String email, String password, String role) async {
    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "fullName": fullName,
        "id": id,
        "email": email,
        "password": password,
        "role": role
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Registration failed');
    }
  }
}
