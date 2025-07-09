import 'package:flutter/material.dart';
import '../../services/api_service.dart';
import '../../utils/app_routes.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({super.key});

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  late Future<List<dynamic>> _projectList;

  @override
  void initState() {
    super.initState();
    _projectList = ApiService.fetchProjectList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Project'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _projectList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada project.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final project = snapshot.data![index];
                return ListTile(
                  title: Text('Project ${project['id']}'),
                  subtitle: Text('Materi ID: ${project['materiId']}'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.projectSubmit,
                      arguments: project['id'],
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
