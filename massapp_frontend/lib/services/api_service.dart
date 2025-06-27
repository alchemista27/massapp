Future<List<MateriModel>> getMateriList() async {
  final url = Uri.parse('$baseUrl/materi');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((e) => MateriModel.fromJson(e)).toList();
  } else {
    throw Exception('Gagal memuat materi');
  }
}
