class ApiService {
  static Future<void> submitMateri({
    required String title,
    required String description,
    required String videoUrl,
    required String pdfUrl,
  }) async {
    print('Submitting Materi: $title, $description, $videoUrl, $pdfUrl');
  }

  static Future<void> submitProject({
    required String userId,
    required String materiId,
    required String fileUrl,
  }) async {
    print('Submitting Project: $userId, $materiId, $fileUrl');
  }
}
