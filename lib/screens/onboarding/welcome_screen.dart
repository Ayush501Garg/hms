import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hms/screens/onboarding/onboarding_screen.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          verticalSpace(20),
          Positioned(child:Image.asset(
            "assets/images/bgimage.png", // Replace with your background image path
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          )),


          Column(
            children: [          
              verticalSpace(60),
              Center(
                child: circularFeatureRingSimple(
                  centerImage: 'assets/images/logo1.png',
                  surroundingImages: [
                    'assets/images/1.png',
                    'assets/images/2.png',
                    'assets/images/3.png',
                    'assets/images/4.png',
                    'assets/images/5.png',
                    'assets/images/6.png',
                  ],
                ),
              ),

              Expanded(child: buildWelcomeContent()),
              // Add any additional widgets like a footer or navigation buttons here
            ],
          ),
        ],
      ),
    );
  }

  Widget buildWelcomeContent() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to nightingale\nUI Kit!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'We bring all of your health information\ntogether on one app, with the power of AI',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: customElevatedButton(
                  title: 'Get Started',
                  // icon: Icons.arrow_forward,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (_) => OnboardingPage()));

                    // Navigate to the next screen
                  },
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Sign In.',
                      style: TextStyle(
                        color: Color(0xFF00C6A2),
                        fontWeight: FontWeight.bold,
                      ),
                      // Add gesture recognizer if using TapGestureRecognizer
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget circularFeatureRingSimple({
    required String centerImage,
    required List<String> surroundingImages, // must be 6
  }) {
    assert(surroundingImages.length == 6, 'Exactly 6 images required');

    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer Circular Border
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.teal, width: 2),
            ),
          ),

          // Center Image
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(centerImage),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Surrounding Images (fixed positions)
          Positioned(top: 0, child: circleImage(surroundingImages[0])),
          Positioned(
            top: 50,
            right: 20,
            child: circleImage(surroundingImages[1]),
          ),
          Positioned(
            bottom: 60,
            right: 15,
            child: circleImage(surroundingImages[2]),
          ),
          Positioned(bottom: 0, child: circleImage(surroundingImages[3])),
          Positioned(
            bottom: 60,
            left: 20,
            child: circleImage(surroundingImages[4]),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: circleImage(surroundingImages[5]),
          ),
        ],
      ),
    );
  }

  // Reusable widget for small image containers
  Widget circleImage(String imagePath) {
    return Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(2.5), // (60 - 55) / 2 = 2.5 padding on all sides
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.teal, width: 2),
        color: Colors.white,
      ),
      child: ClipOval(
        child: Image.asset(imagePath, width: 55, height: 55, fit: BoxFit.cover),
      ),
    );
  }
}
