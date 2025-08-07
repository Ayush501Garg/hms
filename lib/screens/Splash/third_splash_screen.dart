import 'package:flutter/material.dart';
import 'package:hms/screens/Splash/splash_four_screen.dart';
import 'package:hms/utils/navigation_utils.dart';

import '../../core/app_colors.dart';
import '../../core/app_images.dart' show AppImages;
import '../../core/app_text_styles.dart';
import '../../utils/size_utils.dart';

class ThirdSplashScreen extends StatefulWidget {
  const ThirdSplashScreen({super.key});

  @override
  State<ThirdSplashScreen> createState() => _ThirdSplashScreenState();
}

class _ThirdSplashScreenState extends State<ThirdSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      replaceScreen(context, SplashFourScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.logoGreen,
              width: 120,
              height: 120,
              fit: BoxFit.cover,
            ),

            Text("LOADING...", style: primaryText16600),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "nightingale is preparing your health data...",
                textAlign: TextAlign.center,
                style: blackText24400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
