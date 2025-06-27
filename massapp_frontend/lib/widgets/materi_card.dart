import 'package:flutter/material.dart';
import 'package:massapp_frontend/models/materi_model.dart';

class MateriCard extends StatelessWidget {
  final MateriModel materi;
  final VoidCallback onTap;

  const MateriCard({super.key, required this.materi, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(materi.title),
        subtitle: Text(materi.description),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
