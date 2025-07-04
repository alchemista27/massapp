import 'package:flutter/material.dart';

class MateriSubmitPage extends StatefulWidget {
  const MateriSubmitPage({super.key});

  @override
  State<MateriSubmitPage> createState() => _MateriSubmitPageState();
}

class _MateriSubmitPageState extends State<MateriSubmitPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submitMateri() {
    if (_formKey.currentState!.validate()) {
      // TODO: Integrasi API nanti
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Materi Disimpan'),
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
        title: const Text('Submit Materi Baru'),
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
                  labelText: 'Judul Materi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Materi',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Wajib diisi' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitMateri,
                child: const Text('Simpan Materi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
