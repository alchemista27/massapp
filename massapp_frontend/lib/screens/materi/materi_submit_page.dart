import 'package:flutter/material.dart';
import 'package:massapp_frontend/services/api_service.dart';

class MateriSubmitPage extends StatelessWidget {
  const MateriSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Materi')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ApiService.submitMateri(
              title: 'Sample Title',
              description: 'Sample Description',
              videoUrl: 'https://example.com/video.mp4',
              pdfUrl: 'https://example.com/materi.pdf',
            );
          },
          child: const Text('Submit Materi'),
        ),
      ),
    );
  }
}
