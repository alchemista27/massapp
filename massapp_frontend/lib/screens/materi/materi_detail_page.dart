import 'package:flutter/material.dart';

class MateriDetailPage extends StatelessWidget {
  final String judul;

  const MateriDetailPage({super.key, required this.judul});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(judul),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Ini adalah detail untuk materi: $judul\n\nKonten lengkap materi akan ditampilkan di sini.',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
