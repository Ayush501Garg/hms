import 'package:flutter/material.dart';
import 'package:hms/screens/Splash/second_splash_screen.dart';
import 'package:hms/utils/size_utils.dart';
import '../../core/app_colors.dart';
import '../../core/app_images.dart';
import '../../utils/navigation_utils.dart';
import '../../widgets/custom_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      replaceScreen(context, SecondSplashScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            verticalSpace(150),
            Image.asset(AppImages.logowhite, width: 120, height: 120),
            Spacer(),
            const CustomLoader(),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
