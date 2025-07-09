import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../utils/app_routes.dart';

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
    _materiList = ApiService.fetchMateriList();
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
            return const Center(child: Text('Tidak ada materi.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final materi = snapshot.data![index];
                return ListTile(
                  title: Text(materi['title']),
                  subtitle: Text(materi['description']),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.materiDetail,
                      arguments: materi['id'],
                    );
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
