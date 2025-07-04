import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class MateriSubmitPage extends StatefulWidget {
  const MateriSubmitPage({super.key});

  @override
  State<MateriSubmitPage> createState() => _MateriSubmitPageState();
}

class _MateriSubmitPageState extends State<MateriSubmitPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();
  final TextEditingController _pdfUrlController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitMateri() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await ApiService.submitMateri(
        title: _titleController.text,
        description: _descriptionController.text,
        videoUrl: _videoUrlController.text,
        pdfUrl: _pdfUrlController.text,
      );

      if (response.statusCode == 200) {
        Navigator.pop(context);
      } else {
        _showError('Gagal submit materi.');
      }
    } catch (e) {
      _showError('Terjadi kesalahan koneksi.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Materi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _videoUrlController,
              decoration: const InputDecoration(labelText: 'Video URL'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _pdfUrlController,
              decoration: const InputDecoration(labelText: 'PDF URL'),
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submitMateri,
                    child: const Text('Submit Materi'),
                  ),
          ],
        ),
      ),
    );
  }
}
