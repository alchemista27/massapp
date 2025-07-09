import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class ProjectSubmitPage extends StatefulWidget {
  const ProjectSubmitPage({super.key});

  @override
  State<ProjectSubmitPage> createState() => _ProjectSubmitPageState();
}

class _ProjectSubmitPageState extends State<ProjectSubmitPage> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _materiIdController = TextEditingController();
  final TextEditingController _fileUrlController = TextEditingController();

  bool _isLoading = false;

  Future<void> _submitProject() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await ApiService.submitProject(
        userId: _userIdController.text,
        materiId: _materiIdController.text,
        fileUrl: _fileUrlController.text,
      );

      if (response.statusCode == 200) {
        Navigator.pop(context);
      } else {
        _showError('Gagal submit project.');
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
        title: const Text('Submit Project'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(labelText: 'User ID'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _materiIdController,
              decoration: const InputDecoration(labelText: 'Materi ID'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _fileUrlController,
              decoration: const InputDecoration(labelText: 'File URL'),
            ),
            const SizedBox(height: 24),
            _isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _submitProject,
                    child: const Text('Submit Project'),
                  ),
          ],
        ),
      ),
    );
  }
}
