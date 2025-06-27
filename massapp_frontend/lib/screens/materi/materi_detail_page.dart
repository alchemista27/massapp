import 'package:flutter/material.dart';
import 'package:massapp_frontend/models/materi_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MateriDetailPage extends StatelessWidget {
  const MateriDetailPage({Key? key}) : super(key: key);

  void _openPDF(String pdfUrl) async {
    final uri = Uri.parse(pdfUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Tidak bisa membuka PDF.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final MateriModel materi = ModalRoute.of(context)!.settings.arguments as MateriModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(materi.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              materi.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(materi.description),
            const SizedBox(height: 20),
            const Text(
              'Video Pembelajaran:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // Pemutar video Cloudinary
            AspectRatio(
              aspectRatio: 16 / 9,
              child: materi.videoUrl.contains("cloudinary")
                  ? _buildVideoPlayer(materi.videoUrl)
                  : Center(child: Text("Link video tidak valid.")),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => _openPDF(materi.pdfUrl),
              icon: const Icon(Icons.picture_as_pdf),
              label: const Text("Lihat/Unduh Materi PDF"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer(String videoUrl) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Center(
        child: Text(
          "Video tidak bisa diputar langsung.\nBuka via browser jika perlu.",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
