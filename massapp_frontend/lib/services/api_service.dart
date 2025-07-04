import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://107.174.26.23:5000';  // Ganti dengan IP VPS kamu

  static Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return response;
  }

  static Future<http.Response> register(String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );
    return response;
  }
 
 static Future<List<dynamic>> fetchMateriList() async {
  final url = Uri.parse('$baseUrl/materi');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Gagal mengambil daftar materi.');
  }
}

static Future<Map<String, dynamic>> fetchMateriDetail(String id) async {
  final url = Uri.parse('$baseUrl/materi/$id');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Gagal mengambil detail materi.');
  }
}

static Future<http.Response> submitMateri({
  required String title,
  required String description,
  required String videoUrl,
  required String pdfUrl,
}) async {
  final url = Uri.parse('$baseUrl/materi');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'title': title,
      'description': description,
      'videoUrl': videoUrl,
      'pdfUrl': pdfUrl,
    }),
  );
  return response;

static Future<List<dynamic>> fetchProjectList() async {
  final url = Uri.parse('$baseUrl/project');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Gagal mengambil daftar project.');
  }
}

static Future<Map<String, dynamic>> fetchProjectDetail(String id) async {
  final url = Uri.parse('$baseUrl/project/$id');
  final response = await http.get(url);
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
  final url = Uri.parse('$baseUrl/project');
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'userId': userId,
      'materiId': materiId,
      'fileUrl': fileUrl,
    }),
  );
  return response;
  // Endpoint lain bisa ditambahkan nanti di sini
}
