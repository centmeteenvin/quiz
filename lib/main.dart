import 'package:flutter/material.dart';
import 'package:quiz/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quiz/routes.dart';
import 'package:quiz/services/firestore.dart';
import 'package:quiz/services/models.dart';
import 'package:quiz/theme.dart';
import 'package:provider/provider.dart';
// fierbase web id: 1:674191127017:web:b0f2328d3e3446a4579b78

// flutter run -d chrome --web-hostname localhost --web-port 5000

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
    return StreamProvider(
      create: (_) => FireStoreService().streamReport(),
      initialData: Report(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        routes: appRoutes,
      ),
    );
  }
}
