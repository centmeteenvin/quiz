import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/services/firestore.dart';
import 'package:quiz/services/models.dart';
import 'package:quiz/shared/bottom_navbar.dart';
import 'package:quiz/shared/error.dart';
import 'package:quiz/shared/loading.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Topic>>(
      future: FireStoreService().getTopics(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return const ErrorMessage(message: snapshot.hasError.toString());
        } else if (snapshot.hasData) {

        } else {

        }
      },
    );
  }
}