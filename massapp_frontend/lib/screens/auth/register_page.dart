import 'package:flutter/material.dart';
import 'package:massapp_frontend/services/firebase_service.dart';
import 'package:massapp_frontend/utils/app_routes.dart';
import 'package:massapp_frontend/widgets/loading_indicator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseService _firebaseService = FirebaseService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _loading = false;
  String? _error;

  void _handleRegister() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirm = _confirmPasswordController.text.trim();

    if (password != confirm) {
      setState(() => _error = "Password tidak cocok.");
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    final result = await _firebaseService.register(
      email: email,
      password: password,
    );

    setState(() => _loading = false);

    if (result != null) {
      setState(() => _error = result);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Akun')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (_error != null)
              Text(_error!, style: const TextStyle(color: Colors.red)),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(labelText: 'Konfirmasi Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            _loading
                ? const LoadingIndicator()
                : ElevatedButton(
                    onPressed: _handleRegister,
                    child: const Text('Daftar'),
                  ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.login);
              },
              child: const Text("Sudah punya akun? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
