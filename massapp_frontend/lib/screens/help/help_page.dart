import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqs = [
      {
        'question': 'Bagaimana cara login?',
        'answer':
            'Gunakan email dan password yang telah terdaftar untuk login ke aplikasi.'
      },
      {
        'question': 'Bagaimana cara mengakses materi?',
        'answer':
            'Setelah login, buka menu Materi untuk melihat daftar materi yang tersedia.'
      },
      {
        'question': 'Bagaimana cara mengumpulkan project?',
        'answer':
            'Pada menu Project, pilih project yang ingin disubmit lalu ikuti instruksinya.'
      },
      {
        'question': 'Siapa yang bisa saya hubungi untuk bantuan?',
        'answer':
            'Silakan hubungi dosen pengampu atau admin aplikasi untuk bantuan lebih lanjut.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bantuan / FAQ'),
      ),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqs[index]['question']!),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqs[index]['answer']!),
              ),
            ],
          );
        },
      ),
    );
  }
}
