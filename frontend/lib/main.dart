import 'package:flutter/material.dart';
import 'services/api_service.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loggedIn = await ApiService.login('admin@massapp.com', '181818');
  runApp(MyApp(loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool loggedIn;
  const MyApp({super.key, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MassApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: loggedIn ? const HomePage() : const Scaffold(body: Center(child: Text('Login gagal'))),
      debugShowCheckedModeBanner: false,
    );
  }
}
