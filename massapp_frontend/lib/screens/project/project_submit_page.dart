import 'package:flutter/material.dart';

class ProjectSubmitPage extends StatefulWidget {
  const ProjectSubmitPage({super.key});

  @override
  State<ProjectSubmitPage> createState() => _ProjectSubmitPageState();
}

class _ProjectSubmitPageState extends State<ProjectSubmitPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submitProject() {
    if (_formKey.currentState!.validate()) {
      // TODO: Integrasi API nanti
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Project Disubmit'),
          content: Text(
              'Judul: ${_judulController.text}\nDeskripsi: ${_deskripsiController.text}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Project Baru'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(
                  labelText: 'Judul Project',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Project',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitProject,
                child: const Text('Submit Project'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
