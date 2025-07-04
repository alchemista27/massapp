import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Project'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: ApiService.fetchProjectDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Project tidak ditemukan.'));
          } else {
            final project = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User ID: ${project['userId']}'),
                  const SizedBox(height: 16),
                  Text('Materi ID: ${project['materiId']}'),
                  const SizedBox(height: 16),
                  Text('File URL: ${project['fileUrl']}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
