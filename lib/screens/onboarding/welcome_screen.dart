import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_images.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double w = screenWidth(context);
    double h = screenHeight(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            verticalSpace(h * 0.12),

            /// Circular images + center logo + ring
            SizedBox(
              height: h * 0.35,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Circular outline
                  Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primaryColor.withOpacity(0.6),
                        width: 2,
                      ),
                    ),
                  ),

                  // Center Logo
                  Image.asset(
                    AppImages.logoGreen,
                    height: 100,
                    fit: BoxFit.cover,
                  ),

                  // Top (robot)
                  Positioned(top: 0, child: _circleImage(AppImages.img1)),

                  // Top-Left (stethoscope)
                  Positioned(
                    top: 60,
                    left: 30,
                    child: _circleImage(AppImages.img2),
                  ),

                  // Top-Right (file)
                  Positioned(
                    top: 60,
                    right: 30,
                    child: _circleImage(AppImages.img3),
                  ),

                  // Bottom-Left (virus)
                  Positioned(
                    bottom: 60,
                    left: 30,
                    child: _circleImage(AppImages.img4),
                  ),

                  // Bottom-Right (doctor)
                  Positioned(
                    bottom: 60,
                    right: 30,
                    child: _circleImage(AppImages.img5),
                  ),

                  // Bottom (pills)
                  Positioned(bottom: 0, child: _circleImage(AppImages.img6)),
                ],
              ),
            ),

            verticalSpace(h * 0.1),

            Text(
              "Welcome to nightingale\nUI Kit!",
              textAlign: TextAlign.center,
              style: blackText24600,
            ),
            verticalSpace(10),
            Text(
              "We bring all of your health information\ntogether on one app, with the power of AI",
              textAlign: TextAlign.center,
              style: greyText14400,
            ),

            verticalSpace(50),

            /// Get Started Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Get Started", style: whiteText16400),
                    horizontalSpace(6),
                    const Icon(
                      Icons.arrow_forward,
                      size: 18,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            verticalSpace(20),

            /// Sign In
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? ", style: greyText12400),
                GestureDetector(
                  onTap: () {},
                  child: Text("Sign In.", style: primaryText12600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Circle wrapper for images
  Widget _circleImage(String path) {
    return Container(
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: BoxBorder.all(width: 2, color: AppColors.primaryColor),
      ),
      child: Image.asset(path),
    );
  }
}
