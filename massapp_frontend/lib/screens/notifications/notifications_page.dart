import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> notifications = [
      'Pengumuman: Ujian Praktek akan dilaksanakan minggu depan.',
      'Reminder: Deadline pengumpulan project hari Jumat.',
      'Info: Materi baru telah tersedia di aplikasi.',
      'Selamat! Anda berhasil menyelesaikan Project pertama.',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notifications[index]),
          );
        },
      ),
    );
  }
}
