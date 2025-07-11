import 'package:flutter/material.dart';
import '../api/learning_progress_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    fetchProgress();
  }

  void fetchProgress() async {
    final token = 'ISI_TOKEN_MU_DI_SINI';
    final fetchedProgress = await LearningProgressApi.fetchProgress(token);
    setState(() {
      progress = fetchedProgress;
    });
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tanggal: ${today.day}/${today.month}/${today.year}',
                  style: const TextStyle(fontSize: 16),
                ),
                const CircleAvatar(
                  radius: 20,
                  child: Icon(Icons.person),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Progress Belajar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
