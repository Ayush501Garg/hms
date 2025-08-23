import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/profile/BiometricSetupScreen.dart';
import 'package:hms/screens/profile/scan_document_details_screen.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/switch_next_screen.dart';

class VerificationSuccessScreen extends StatelessWidget {
  const VerificationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Success icon
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 24),

              // Title
               Text(
                "Identity successfully verified",
                style: blackText24400,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 12),

              // Subtitle / description
              const Text(
                "To help improve KYC processes on Nightingale Health, we need to collect some information to make sure it’s really you! 👍",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              // Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // Navigate to next step
                  },
                  child: const Text(
                    "Continue →",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

               customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward_ios,

                onPressed: () {
                  customNavigate(context, BiometricSetupScreen());
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
