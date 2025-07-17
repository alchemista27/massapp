import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static late String baseUrl;

  static Future<void> loadConfig() async {
    final configString = await rootBundle.loadString('assets/config.json');
    final config = jsonDecode(configString);
    baseUrl = config['API_URL'];
  }

  static Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Login gagal: ${response.body}');
    }
  }
}
