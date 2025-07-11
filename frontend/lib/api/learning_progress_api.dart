import 'dart:convert';
import 'package:http/http.dart' as http;

class LearningProgressApi {
  static Future<double> fetchProgress(String token) async {
    final response = await http.get(
      Uri.parse('http://[IP_VPS_KAMU]:5000/api/learning-progress'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['progress'].toDouble();
    } else {
      throw Exception('Failed to load progress');
    }
  }
}
