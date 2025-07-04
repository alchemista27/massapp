import 'package:flutter/material.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/register_page.dart';
import 'screens/dashboard/dashboard_page.dart';
import 'screens/materi/materi_list_page.dart';
import 'screens/materi/materi_submit_page.dart';
import 'utils/app_routes.dart';

void main() {
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
        AppRoutes.materiSubmit: (context) => const MateriSubmitPage(),
      },
    );
  }
}
