import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:massapp_frontend/models/materi_model.dart';

class ApiService {
  // Ganti dengan URL backend Railway kamu
  static const String baseUrl = 'https://massapp-backend.up.railway.app';

  /// Ambil daftar materi
  Future<List<MateriModel>> getMateriList() async {
    final url = Uri.parse('$baseUrl/materi');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => MateriModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat materi');
    }
  }

  /// Submit tugas proyek
  Future<void> submitProject({
    required String userId,
    required int materiId,
    required String fileUrl,
  }) async {
    final url = Uri.parse('$baseUrl/projects/submit');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'user_id': userId,
        'materi_id': materiId,
        'file_url': fileUrl,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal mengirim tugas proyek');
    }
  }
}
