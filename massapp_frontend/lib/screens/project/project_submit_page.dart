import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:massapp_frontend/services/cloudinary_service.dart';
import 'package:massapp_frontend/services/api_service.dart';

class ProjectSubmitPage extends StatefulWidget {
  const ProjectSubmitPage({super.key});

  @override
  State<ProjectSubmitPage> createState() => _ProjectSubmitPageState();
}

class _ProjectSubmitPageState extends State<ProjectSubmitPage> {
  File? _selectedFile;
  bool _isUploading = false;
  String? _uploadUrl;
  String? _message;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'mp4'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _submitProject() async {
    if (_selectedFile == null) return;

    setState(() {
      _isUploading = true;
      _message = null;
    });

    try {
      // Upload ke Cloudinary
      final url = await CloudinaryService.uploadFile(_selectedFile!);
      if (url == null) throw Exception('Gagal upload ke Cloudinary');

      setState(() => _uploadUrl = url);

      // Kirim URL ke backend (dummy user_id dan materi_id untuk contoh)
      await ApiService().submitProject(
        userId: 'USER_ID',  // Ganti dengan ID user Firebase Auth nantinya
        materiId: 1,        // Sesuaikan dengan materi terkait
        fileUrl: url,
      );

      setState(() {
        _message = 'Tugas berhasil dikumpulkan!';
      });
    } catch (e) {
      setState(() {
        _message = 'Error: $e';
      });
    } finally {
      setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kumpulkan Tugas')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _selectedFile != null
                ? Text('File terpilih: ${_selectedFile!.path.split('/').last}')
                : const Text('Belum ada file dipilih'),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.attach_file),
              label: const Text('Pilih File (PDF / Video)'),
            ),
            const SizedBox(height: 16),
            _isUploading
                ? const CircularProgressIndicator()
                : ElevatedButton.icon(
                    onPressed: _selectedFile != null ? _submitProject : null,
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Kumpulkan Tugas'),
                  ),
            const SizedBox(height: 16),
            if (_uploadUrl != null)
              Text('URL File: $_uploadUrl', style: const TextStyle(fontSize: 12)),
            if (_message != null)
              Text(_message!, style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
