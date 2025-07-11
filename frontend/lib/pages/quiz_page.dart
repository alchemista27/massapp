import 'package:flutter/material.dart';
import '../services/api_service.dart';

class QuizPage extends StatelessWidget {
  final int materiId;

  const QuizPage({super.key, required this.materiId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz')),
      body: FutureBuilder<List<dynamic>>(
        future: ApiService.fetchQuizzes(materiId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading quizzes'));
          } else {
            final quizzes = snapshot.data!;
            return ListView.builder(
              itemCount: quizzes.length,
              itemBuilder: (context, index) {
                final quiz = quizzes[index];
                return ListTile(
                  title: Text(quiz['pertanyaan']),
                  subtitle: Text('Jawaban Benar: ${quiz['jawaban_benar']}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
