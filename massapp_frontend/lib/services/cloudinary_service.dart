import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName = 'dz4hpd1c6';
  static const String uploadPreset = 'massapp_unsigned';

  static const String uploadUrl = 'https://api.cloudinary.com/v1_1/$cloudName/auto/upload';

  /// Upload file (video atau PDF) ke Cloudinary
  static Future<String?> uploadFile(File file) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      final response = await request.send();

      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final jsonResponse = jsonDecode(responseData);
        return jsonResponse['secure_url']; // URL file
      } else {
        throw Exception('Gagal upload file (Code: ${response.statusCode})');
      }
    } catch (e) {
      rethrow;
    }
  }
}
