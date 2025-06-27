class MateriModel {
  final int id;
  final String title;
  final String description;
  final String videoUrl;
  final String pdfUrl;

  MateriModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.pdfUrl,
  });

  factory MateriModel.fromJson(Map<String, dynamic> json) {
    return MateriModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      videoUrl: json['video_url'],
      pdfUrl: json['pdf_url'],
    );
  }
}
