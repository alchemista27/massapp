import 'package:flutter/material.dart';
import '../services/api_service.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<dynamic> quizzes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadQuizzes();
  }

  Future<void> loadQuizzes() async {
    try {
      final data = await ApiService.fetchAllQuizzes();
      setState(() {
        quizzes = data;
        isLoading = false;
      });
    } catch (e) {
      print('Error loading quizzes: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semua Quizzes'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return ListTile(
                  title: Text(quiz['pertanyaan']),
                  subtitle: Text('Jawaban: ${quiz['jawaban_benar']}'),
                );
              },
            ),
    );
  }
}
