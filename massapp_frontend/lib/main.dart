import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:massapp_frontend/screens/auth/login_page.dart';
import 'package:massapp_frontend/screens/auth/register_page.dart';
import 'package:massapp_frontend/screens/dashboard/dashboard_page.dart';
import 'package:massapp_frontend/screens/materi/materi_list_page.dart';
import 'package:massapp_frontend/screens/materi/materi_detail_page.dart';
import 'package:massapp_frontend/screens/materi/materi_submit_page.dart';
import 'package:massapp_frontend/screens/project/project_list_page.dart';
import 'package:massapp_frontend/screens/project/project_submit_page.dart';
import 'package:massapp_frontend/utils/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MassApp());
}

class MassApp extends StatelessWidget {
  const MassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MassApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => const LoginPage(),
        AppRoutes.register: (context) => const RegisterPage(),
        AppRoutes.dashboard: (context) => const DashboardPage(),
        AppRoutes.materiList: (context) => const MateriListPage(),
        AppRoutes.materiDetail: (context) => const MateriDetailPage(),
        AppRoutes.materiSubmit: (context) => const MateriSubmitPage(),
        AppRoutes.projectList: (context) => const ProjectListPage(),
        AppRoutes.projectSubmit: (context) => const ProjectSubmitPage(),
      },
    );
  }
}
