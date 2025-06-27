import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Mendapatkan user yang sedang login
  User? get currentUser => _auth.currentUser;

  /// Mendaftar user baru
  Future<String?> register({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // sukses
    } on FirebaseAuthException catch (e) {
      return _handleError(e);
    } catch (e) {
      return "Terjadi kesalahan saat register.";
    }
  }

  /// Login user
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // sukses
    } on FirebaseAuthException catch (e) {
      return _handleError(e);
    } catch (e) {
      return "Terjadi kesalahan saat login.";
    }
  }

  /// Logout user
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// Menangani error Firebase
  String _handleError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return 'Email tidak ditemukan.';
      case 'wrong-password':
        return 'Password salah.';
      case 'email-already-in-use':
        return 'Email sudah digunakan.';
      case 'weak-password':
        return 'Password terlalu lemah.';
      case 'invalid-email':
        return 'Format email tidak valid.';
      default:
        return 'Terjadi kesalahan. (${e.code})';
    }
  }
}
