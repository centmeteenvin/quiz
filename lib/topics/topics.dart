import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz/shared/bottom_navbar.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavBar(),
    );
  }
}