import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final String judul;

  const ProjectDetailPage({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Detail lengkap untuk project: $judul\n\nPetunjuk dan informasi lengkap akan ditampilkan di sini.',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
