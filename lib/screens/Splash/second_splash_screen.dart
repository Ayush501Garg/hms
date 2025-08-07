import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/Splash/third_splash_screen.dart';
import 'package:hms/utils/navigation_utils.dart';

import '../../core/app_images.dart';
import '../../utils/size_utils.dart';

class SecondSplashScreen extends StatefulWidget {
  const SecondSplashScreen({super.key});

  @override
  State<SecondSplashScreen> createState() => _SecondSplashScreenState();
}

class _SecondSplashScreenState extends State<SecondSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      replaceScreen(context, ThirdSplashScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            AppImages.splashBg, // Make sure this is your image name
            fit: BoxFit.cover,
          ),

          // Content overlay
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(AppImages.logowhite, width: 60, height: 60),
              verticalSpace(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Smart Medical & E-Pharmacy\nApp For You.",
                  textAlign: TextAlign.center,
                  style: whiteText24400,
                ),
              ),
              verticalSpace(40),
            ],
          ),
        ],
      ),
    );
  }
}
