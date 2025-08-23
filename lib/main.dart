import 'package:flutter/material.dart';
import 'package:hms/screens/Splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // Main Code test
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Management System',
      // home: SetupAccountScreen(),
      // home: OnboardingPage(),
      home: SplashScreen(),
    );
  }
}
