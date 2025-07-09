import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'MassApp - Aplikasi Pembelajaran Pendidikan Jasmani',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Versi: 1.0.0',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Dikembangkan oleh: Tim MassApp Developer\n'
              'Aplikasi ini bertujuan untuk membantu proses pembelajaran Pendidikan Jasmani berbasis proyek.\n\n'
              'Fitur utama:\n'
              '- Materi Pembelajaran\n'
              '- Tugas & Project\n'
              '- Profil Pengguna\n'
              '- Pengaturan Aplikasi',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
