import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class MateriSubmitPage extends StatefulWidget {
  @override
  _MateriSubmitPageState createState() => _MateriSubmitPageState();
}

class _MateriSubmitPageState extends State<MateriSubmitPage> {
  final _judulController = TextEditingController();
  final _deskripsiController = TextEditingController();

  @override
  void dispose() {
    _judulController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submit() async {
    final data = {
      'judul': _judulController.text,
      'deskripsi': _deskripsiController.text,
    };
    final response = await ApiService.submitMateri(data);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submit Berhasil')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal Submit')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit Materi')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _judulController, decoration: InputDecoration(labelText: 'Judul')),
            TextField(controller: _deskripsiController, decoration: InputDecoration(labelText: 'Deskripsi')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
