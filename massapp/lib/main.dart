import 'package:flutter/material.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/register_page.dart';
import 'screens/dashboard/dashboard_page.dart';
import 'screens/materi/materi_list_page.dart';
import 'screens/materi/materi_submit_page.dart';
import 'screens/project/project_list_page.dart';
import 'screens/project/project_submit_page.dart';
import 'screens/profile/profile_page.dart';
import 'screens/settings/settings_page.dart';
import 'screens/about/about_page.dart';
import 'screens/history/history_page.dart';
import 'screens/notifications/notifications_page.dart';
import 'screens/help/help_page.dart';
import 'utils/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
 // ini file hasil flutterfire configure


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
        AppRoutes.projectList: (context) => const ProjectListPage(),
        AppRoutes.projectSubmit: (context) => const ProjectSubmitPage(),
        AppRoutes.profile: (context) => const ProfilePage(),
        AppRoutes.settings: (context) => const SettingsPage(),
        AppRoutes.about: (context) => const AboutPage(),
        AppRoutes.history: (context) => const HistoryPage(),
        AppRoutes.notifications: (context) => const NotificationsPage(),
        AppRoutes.help: (context) => const HelpPage(),
      },
    );
  }
}
