import 'package:flutter/material.dart';
import 'package:massapp_frontend/services/api_service.dart';

class MateriListPage extends StatefulWidget {
  const MateriListPage({super.key});

  @override
  State<MateriListPage> createState() => _MateriListPageState();
}

class _MateriListPageState extends State<MateriListPage> {
  late Future<List<dynamic>> _materiList;

  @override
  void initState() {
    super.initState();
    _materiList = ApiService.fetchMateri();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Materi'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _materiList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Belum ada materi.'));
          } else {
            final materiList = snapshot.data!;
            return ListView.builder(
              itemCount: materiList.length,
              itemBuilder: (context, index) {
                final materi = materiList[index];
                return ListTile(
                  title: Text(materi['title'] ?? 'Tanpa Judul'),
                  subtitle: Text(materi['description'] ?? 'Tanpa Deskripsi'),
                  onTap: () {
                    // Aksi saat item diklik (opsional)
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
