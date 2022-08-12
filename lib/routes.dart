
import 'package:quiz/about/about.dart';
import 'package:quiz/home/home.dart';
import 'package:quiz/login/login.dart';
import 'package:quiz/profile/profile.dart';
import 'package:quiz/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/login': (context) => const LoginScreen(),
  '/about': (context) => const AboutScreen(),
  '/profile': (context) => const ProfileScreen(),
  '/topics': (context) => const TopicsScreen(),
};