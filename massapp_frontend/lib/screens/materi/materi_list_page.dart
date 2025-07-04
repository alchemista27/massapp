import 'package:flutter/material.dart';
import 'materi_detail_page.dart';

class MateriListPage extends StatelessWidget {
  const MateriListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> materiList = [
      'Materi 1: Pemanasan',
      'Materi 2: Olahraga Inti',
      'Materi 3: Pendinginan',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Materi'),
      ),
      body: ListView.builder(
        itemCount: materiList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(materiList[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MateriDetailPage(
                    judul: materiList[index],
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
