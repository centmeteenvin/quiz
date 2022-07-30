import 'package:flutter/material.dart';
import 'package:quiz/services/auth.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('profile'),
      ),
      body: ElevatedButton(
        onPressed: () async {
          await AuthService().singOut();
          // ignore: use_build_context_synchronously
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        child: const Text('Signout'),
      ),
    );
  }
}