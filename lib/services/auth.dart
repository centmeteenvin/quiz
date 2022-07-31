import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class AuthService {
  final userStream = FirebaseAuth.instance.authStateChanges();
  final user = FirebaseAuth.instance;

  Future<void> anonLogin() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      //handle errors
      log(e.message!);
    }
  }

  Future<void> singOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> googleLogin() async {
    try {
      final googleUser = await GoogleSignIn(clientId: "674191127017-qlmsnp1gsjkom9hibk9mm70055c9ltv0.apps.googleusercontent.com").signIn();

      if (googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(authCredential);
    } on FirebaseAuthException catch (e) {
      //handle error
      log(e.message!);
    }
  }
}