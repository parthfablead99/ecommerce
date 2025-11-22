import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  // ---------------- Email Login -----------------
  Future<User?> loginEmail(String email, String password) async {
    try {
      loading = true;
      notifyListeners();

      final UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      loading = false;
      notifyListeners();
      return result.user;

    } on FirebaseAuthException catch (e) {
      loading = false;
      notifyListeners();
      print("Email Login Error: ${e.message}");
      return null;
    }
  }

  // ---------------- Google Login -----------------
  Future<User?> signInWithGoogle() async {
    try {
      loading = true;
      notifyListeners();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        loading = false;
        notifyListeners();
        return null; // Cancelled
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential result =
      await _auth.signInWithCredential(credential);

      loading = false;
      notifyListeners();
      return result.user;

    } catch (e) {
      loading = false;
      notifyListeners();
      print("Google Sign-in Error: $e");
      return null;
    }
  }
}