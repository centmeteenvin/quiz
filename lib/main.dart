import 'package:flutter/material.dart';
import 'package:quiz/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz/routes.dart';
import 'package:quiz/theme.dart';
import 'package:google_fonts/google_fonts.dart';
// fierbase web id: 1:674191127017:web:b0f2328d3e3446a4579b78

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const FlutterQuiz());
}

class FlutterQuiz extends StatelessWidget {
  const FlutterQuiz({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      routes: appRoutes,
    );
  }
}
