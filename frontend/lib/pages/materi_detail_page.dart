import 'quiz_page.dart';
import 'project_page.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MateriDetailPage extends StatefulWidget {
  final int materiId;

  const MateriDetailPage({super.key, required this.materiId});

  @override
  State<MateriDetailPage> createState() => _MateriDetailPageState();
}

class _MateriDetailPageState extends State<MateriDetailPage> {
  List<dynamic> projects = [];
  List<dynamic> quizzes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDetail();
  }

  Future<void> loadDetail() async {
    try {
      final proj = await ApiService.fetchProjects(widget.materiId);
      final quiz = await ApiService.fetchQuizzes(widget.materiId);
      setState(() {
        projects = proj;
        quizzes = quiz;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading detail: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Materi'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text('Projects',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...projects.map((p) => ListTile(
                      title: Text(p['judul']),
                      subtitle: Text(p['deskripsi']),
                    )),
                const SizedBox(height: 24),
                const Text('Quizzes',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                ...quizzes.map((q) => ListTile(
                      title: Text(q['pertanyaan']),
                      subtitle: Text('Jawaban: ${q['jawaban_benar']}'),
                    )),
                ElevatedButton(
  onPressed: () {},
  child: const Text('Daftar Materi Sekarang'),
),
              ],
            ),
    );
  }
}
