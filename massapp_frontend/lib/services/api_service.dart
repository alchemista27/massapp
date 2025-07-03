import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://massapp-backend.onrender.com'; // Ganti URL backend nanti

  // Ambil daftar materi
  static Future<List<dynamic>> fetchMateri() async {
    final response = await http.get(Uri.parse('$baseUrl/materi'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Gagal mengambil data materi');
    }
  }

  // Submit materi baru
  static Future<void> submitMateri(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/materi/submit'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal submit materi');
    }
  }

  // Submit tugas proyek
  static Future<void> submitProject(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/projects/submit'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal submit proyek');
    }
  }
}
