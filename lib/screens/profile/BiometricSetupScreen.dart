import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/widgets/custome_button.dart';

class BiometricSetupScreen extends StatelessWidget {
  const BiometricSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              

              // Title
               Text(
                "Biometric Setup",
                style: blackText24400,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // Subtitle
               Text(
                "Place out your fingerprint on your touch sensor for 5 seconds.",
                style: greyText16400,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Fingerprint Image
              Image.network(
                "https://i.pinimg.com/736x/3c/59/6e/3c596ee60c6aec400b19af6a3dbb3c44.jpg", // 👈 replace with your asset
                height: 160,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 50),

              // Continue button
              customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward_ios,
               

                onPressed: () {

                }
              ),

              const SizedBox(height: 16),

              // Skip this step
              TextButton(
                onPressed: () {
                  // Skip biometric setup
                },
                child: const Text(
                  "Skip this step",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
