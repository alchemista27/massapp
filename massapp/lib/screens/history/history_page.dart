import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> activityLogs = [
      'Login pada 10 Juni 2025 - 08:15',
      'Mengakses Materi: Teknik Dasar Lari - 10 Juni 2025 - 08:20',
      'Submit Project: Video Latihan - 10 Juni 2025 - 08:30',
      'Logout - 10 Juni 2025 - 08:45',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Aktivitas'),
      ),
      body: ListView.builder(
        itemCount: activityLogs.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.history),
            title: Text(activityLogs[index]),
          );
        },
      ),
    );
  }
}
