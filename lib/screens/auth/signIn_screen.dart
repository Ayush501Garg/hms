import 'package:flutter/material.dart';
import 'package:hms/utils/size_utils.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          verticalSpace(100),
          Image.asset("assets/images/logo1.png", width: 80, height: 80),
          verticalSpace(20),
          Text("nightingale"),
          verticalSpace(20),
          Text("Sign in to access smart medical & e-pharma"),
          
        
        ],),
      ),
    );
  }
}
