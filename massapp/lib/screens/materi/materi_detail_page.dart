import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class MateriDetailPage extends StatelessWidget {
  const MateriDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Materi'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService.fetchMateriDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Materi tidak ditemukan.'));
          } else {
            final materi = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    materi['title'],
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(materi['description']),
                  const SizedBox(height: 16),
                  Text('Video: ${materi['videoUrl']}'),
                  const SizedBox(height: 8),
                  Text('PDF: ${materi['pdfUrl']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
