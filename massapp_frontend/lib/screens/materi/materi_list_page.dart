import 'package:flutter/material.dart';
import 'package:massapp_frontend/models/materi_model.dart';
import 'package:massapp_frontend/services/api_service.dart';
import 'package:massapp_frontend/widgets/materi_card.dart';
import 'package:massapp_frontend/utils/app_routes.dart';

class MateriListPage extends StatefulWidget {
  const MateriListPage({super.key});

  @override
  State<MateriListPage> createState() => _MateriListPageState();
}

class _MateriListPageState extends State<MateriListPage> {
  late Future<List<MateriModel>> _materiList;

  @override
  void initState() {
    super.initState();
    _materiList = ApiService().getMateriList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Materi Pembelajaran')),
      body: FutureBuilder<List<MateriModel>>(
        future: _materiList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Gagal memuat data: ${snapshot.error}'));
          }

          final materi = snapshot.data ?? [];

          if (materi.isEmpty) {
            return const Center(child: Text('Belum ada materi.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: materi.length,
            itemBuilder: (context, index) {
              final item = materi[index];
              return MateriCard(
                materi: item,
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.materiDetail,
                    arguments: item,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
