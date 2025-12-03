import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'intro_screens/travel_homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      // Starts with onboarding screen
      home: const OnBoardingScreen(),
    );
  }
}
