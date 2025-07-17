import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ApiService.loadConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MassApp',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: "admin@massapp.com");
  final passwordController = TextEditingController(text: "181818");
  String message = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                try {
                  final res = await ApiService.login(emailController.text, passwordController.text);
                  setState(() {
                    message = "Login berhasil! Token: ${res['token']}";
                  });
                } catch (e) {
                  setState(() {
                    message = "Login gagal: $e";
                  });
                }
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 16),
            Text(message),
          ],
        ),
      ),
    );
  }
}
