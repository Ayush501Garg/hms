import 'package:flutter/material.dart';
import 'package:hms/screens/auth/forgot_password_option_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hospital Management System',
      home: ForgotPasswordOptionScreen(),
    );
  }
}
