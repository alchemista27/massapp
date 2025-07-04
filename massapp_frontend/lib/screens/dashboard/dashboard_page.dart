import 'package:flutter/material.dart';
import '../../utils/app_routes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Selamat Datang di Dashboard MassApp!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.materiList);
                },
                child: const Text('Lihat Daftar Materi'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.materiSubmit);
                },
                child: const Text('Tambah Materi Baru'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.projectList);
                },
                child: const Text('Lihat Daftar Project'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.projectSubmit);
                },
                child: const Text('Tambah Project Baru'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.profile);
                },
                child: const Text('Profil Pengguna'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.settings);
                },
                child: const Text('Pengaturan'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.about);
                },
                child: const Text('Tentang Aplikasi'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.history);
                },
                child: const Text('Riwayat Aktivitas'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.notifications);
                },
                child: const Text('Notifikasi'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.help);
                },
                child: const Text('Bantuan / FAQ'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
