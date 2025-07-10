import 'package:flutter/material.dart';
import '../../services/api_service.dart';

class ProjectSubmitPage extends StatefulWidget {
  @override
  _ProjectSubmitPageState createState() => _ProjectSubmitPageState();
}

class _ProjectSubmitPageState extends State<ProjectSubmitPage> {
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  void _submit() async {
    final data = {
      'nama': _namaController.text,
      'deskripsi': _deskripsiController.text,
    };
    final response = await ApiService.submitProject(data);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Submit Berhasil')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Gagal Submit')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit Project')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _namaController, decoration: InputDecoration(labelText: 'Nama')),
            TextField(controller: _deskripsiController, decoration: InputDecoration(labelText: 'Deskripsi')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}
