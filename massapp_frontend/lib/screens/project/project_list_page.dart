import 'package:flutter/material.dart';
import 'project_detail_page.dart';

class ProjectListPage extends StatelessWidget {
  const ProjectListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> projectList = [
      'Project 1: Laporan Olahraga Mingguan',
      'Project 2: Video Latihan',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Project / Tugas'),
      ),
      body: ListView.builder(
        itemCount: projectList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(projectList[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProjectDetailPage(
                    judul: projectList[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
