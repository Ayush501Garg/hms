import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hms/screens/onboarding/onboarding_screen.dart';
import 'package:hms/screens/auth/signIn_screen.dart';
import 'package:hms/screens/onboarding/welcome_screen.dart';

import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_images.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/onboarding/welcome_screen.dart' hide WelcomeScreen;
import 'package:hms/utils/navigation_utils.dart';

import '../../utils/size_utils.dart';

class SplashFourScreen extends StatefulWidget {
  const SplashFourScreen({super.key});

  @override
  State<SplashFourScreen> createState() => _SplashFourScreenState();
}

class _SplashFourScreenState extends State<SplashFourScreen> {
  double progress = 0.5;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        progress = 1.0;
      });
    });

    Timer(const Duration(milliseconds: 1200), () {
      replaceScreen(context, WelcomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FFFD),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          verticalSpace(100),

          Center(
            child: Image.asset(
              AppImages.logoGreen,
              height: 120,
              fit: BoxFit.cover,
            ), // Use your logo asset
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 8,
              borderRadius: BorderRadius.circular(20),
              color: AppColors.primaryColor,
              backgroundColor: const Color(0xFFE8E8E8),
            ),
          ),
          verticalSpace(12),
          Text("${(progress * 100).toInt()}%", style: primaryText16600),
          verticalSpace(100),
        ],
      ),
    );
  }
}
