import 'package:flutter/material.dart';

class MateriListPage extends StatelessWidget {
  const MateriListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Materi'),
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Materi 1: Pemanasan'),
          ),
          ListTile(
            title: Text('Materi 2: Olahraga Inti'),
          ),
          ListTile(
            title: Text('Materi 3: Pendinginan'),
          ),
        ],
      ),
    );
  }
}

