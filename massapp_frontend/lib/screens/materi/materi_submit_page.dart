import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:massapp_frontend/services/cloudinary_service.dart';
import 'package:massapp_frontend/services/api_service.dart';

class MateriSubmitPage extends StatefulWidget {
  const MateriSubmitPage({super.key});

  @override
  State<MateriSubmitPage> createState() => _MateriSubmitPageState();
}

class _MateriSubmitPageState extends State<MateriSubmitPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  File? _videoFile;
  File? _pdfFile;
  bool _isUploading = false;
  String? _message;

  Future<void> _pickVideo() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.video,
    );

    if (result != null && result.files.single.path != null) {
      setState(() => _videoFile = File(result.files.single.path!));
    }
  }

  Future<void> _pickPDF() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() => _pdfFile = File(result.files.single.path!));
    }
  }

  Future<void> _submitMateri() async {
    if (_titleController.text.isEmpty ||
        _descriptionController.text.isEmpty ||
        _videoFile == null ||
        _pdfFile == null) {
      setState(() => _message = 'Semua field wajib diisi.');
      return;
    }

    setState(() {
      _isUploading = true;
      _message = null;
    });

    try {
      final videoUrl = await CloudinaryService.uploadFile(_videoFile!);
      final pdfUrl = await CloudinaryService.uploadFile(_pdfFile!);

      if (videoUrl == null || pdfUrl == null) {
        throw Exception('Gagal upload file.');
      }

      await ApiService().submitMateri(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        videoUrl: videoUrl,
        pdfUrl: pdfUrl,
      );

      setState(() {
        _message = 'Materi berhasil ditambahkan!';
        _titleController.clear();
        _descriptionController.clear();
        _videoFile = null;
        _pdfFile = null;
      });
    } catch (e) {
      setState(() => _message = 'Error: $e');
    } finally {
      setState(() => _isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Materi Baru')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Judul Materi'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Deskripsi Materi'),
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _pickVideo,
                icon: const Icon(Icons.video_library),
                label: const Text('Pilih Video Materi'),
              ),
              if (_videoFile != null)
                Text('Video: ${_videoFile!.path.split('/').last}'),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: _pickPDF,
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Pilih PDF Materi'),
              ),
              if (_pdfFile != null)
                Text('PDF: ${_pdfFile!.path.split('/').last}'),
              const SizedBox(height: 20),
              _isUploading
                  ? const CircularProgressIndicator()
                  : ElevatedButton.icon(
                      onPressed: _submitMateri,
                      icon: const Icon(Icons.cloud_upload),
                      label: const Text('Upload Materi'),
                    ),
              const SizedBox(height: 16),
              if (_message != null)
                Text(
                  _message!,
                  style: TextStyle(
                    color: _message!.startsWith('Error') ? Colors.red : Colors.green,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
