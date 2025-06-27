import 'package:flutter/material.dart';
import 'package:massapp_frontend/services/firebase_service.dart';
import 'package:massapp_frontend/utils/app_routes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  void _logout(BuildContext context) async {
    await FirebaseService().logout();
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseService().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Halo, ${user?.email ?? "User"}!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.materiList);
              },
              icon: const Icon(Icons.video_library),
              label: const Text('Materi Pembelajaran'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.projectList);
              },
              icon: const Icon(Icons.assignment),
              label: const Text('Tugas Proyek'),
            ),
          ],
        ),
      ),
    );
  }
}
