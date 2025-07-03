import 'package:flutter/material.dart';
import 'package:massapp_frontend/utils/app_routes.dart';

class ProjectListPage extends StatelessWidget {
  const ProjectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data proyek (bisa diganti nanti dengan API backend)
    final List<Map<String, dynamic>> projects = [
      {'id': 1, 'title': 'Proyek Kebugaran Fisik'},
      {'id': 2, 'title': 'Proyek Keterampilan Motorik Dasar'},
      {'id': 3, 'title': 'Proyek Evaluasi Diri Olahraga'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Tugas Proyek')),
      body: ListView.builder(
        itemCount: projects.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final project = projects[index];
          return Card(
            child: ListTile(
              title: Text(project['title']),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.projectSubmit,
                  arguments: project,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
