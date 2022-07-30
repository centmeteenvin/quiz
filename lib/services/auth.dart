import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance;

  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      //handle errors
    }
  }

  Future<void> singOut() async {
    await FirebaseAuth.instance.signOut();
  }
}