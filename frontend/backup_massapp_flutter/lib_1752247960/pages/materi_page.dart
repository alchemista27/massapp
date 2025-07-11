import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'materi_detail_page.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  List<dynamic> materiList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMateri();
  }

  Future<void> loadMateri() async {
    try {
      final materi = await ApiService.fetchMateri();
      setState(() {
        materiList = materi;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading materi: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Materi'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: materiList.length,
              itemBuilder: (context, index) {
                final item = materiList[index];
                return ListTile(
                  leading: const Icon(Icons.book),
                  title: Text(item['judul']),
                  subtitle: Text(item['deskripsi']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MateriDetailPage(materiId: item['id']),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
