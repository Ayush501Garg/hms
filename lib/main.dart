import 'package:flutter/material.dart';
import 'package:hms/screens/profile/profile_intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Main Code
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Management System',
      home: Profile_Intro_screen(),
      // home: OnboardingPage(),
      // home: SplashScreen(),
    );
  }
}
