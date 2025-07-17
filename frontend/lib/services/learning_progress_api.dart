import 'dart:convert';
import 'package:http/http.dart' as http;

class LearningProgressApi {
  static const String baseUrl = "http://107.174.26.23/massapp/api";

  static Future<Map<String, dynamic>> fetchProgress(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/learning-progress"),
      headers: {'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYWRtaW4iLCJyb2xlIjoiYWRtaW4iLCJpYXQiOjE3NTIyNjU1NzEsImV4cCI6MTc1MjI2OTE3MX0.MmOs2og8Oge5Nm5YnZJpNYLmPC9VlVgKIEqFacyD2eU'},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {'error': 'Failed to fetch learning progress'};
    }
  }
}
