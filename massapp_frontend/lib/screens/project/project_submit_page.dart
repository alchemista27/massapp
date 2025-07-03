import 'package:flutter/material.dart';
import 'package:massapp_frontend/services/api_service.dart';

class ProjectSubmitPage extends StatelessWidget {
  const ProjectSubmitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Project')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ApiService.submitProject(
              userId: 'user123',
              materiId: 'materi456',
              fileUrl: 'https://example.com/file.pdf',
            );
          },
          child: const Text('Submit Project'),
        ),
      ),
    );
  }
}

