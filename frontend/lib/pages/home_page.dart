import 'package:flutter/material.dart';
import '../services/learning_progress_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? progressData;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    const dummyToken = 'YOUR_TOKEN_HERE';
    final result = await LearningProgressApi.fetchProgress(dummyToken);
    setState(() {
      progressData = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: progressData != null
            ? Text('Progress: ${progressData.toString()}')
            : const CircularProgressIndicator(),
      ),
    );
  }
}
