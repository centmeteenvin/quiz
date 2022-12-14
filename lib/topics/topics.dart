import 'package:flutter/material.dart';
import 'package:quiz/services/firestore.dart';
import 'package:quiz/services/models.dart';
import 'package:quiz/shared/bottom_navbar.dart';
import 'package:quiz/shared/error.dart';
import 'package:quiz/shared/loading.dart';
import 'package:quiz/topics/drawer.dart';
import 'package:quiz/topics/topic_item.dart';

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
          return ErrorMessage(message: snapshot.hasError.toString());
        } else if (snapshot.hasData) {
          var topics = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Topics'),
              backgroundColor: Colors.deepPurple,
            ),
            body: GridView.count(
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 12,
              children: topics.map((topic) => TopicItem(topic: topic)).toList(),
            ),
            bottomNavigationBar: const BottomNavBar(),
            drawer: TopicDrawer(topics: topics),
          );
        } else {
          return const Text('No topics found in FireStore, check database');
        }
      },
    );
  }
}
