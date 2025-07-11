import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ProjectPage extends StatelessWidget {
  final int materiId;

  const ProjectPage({super.key, required this.materiId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.fetchProjects(materiId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading projects'));
          } else {
            final projects = snapshot.data!;
            return ListView.builder(
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ListTile(
                  title: Text(project['judul']),
                  subtitle: Text(project['deskripsi']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
