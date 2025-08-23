import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/profile/VerificationSuccessScreen.dart';
import 'package:hms/screens/profile/VerifyPasscodeScreen.dart';
import 'package:hms/screens/profile/scan_document_details_screen.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/switch_next_screen.dart';

class ScanIdScreen extends StatelessWidget {
  const ScanIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Title
              Text(
                "Scan Your Identification",
                style: blackText24400,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              // Subtitle
              Text(
                "Let's take a pic of your ID or passport",
                style: greyText14400,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30),

              // Illustration (replace with your asset / network image)
              Center(
                child: Image.asset(
                  "assets/images/idcardimage.jpg", // 👈 put your image here
                  // "assets\images\idcardimage.jpeg", // 👈 put your image here
                  height: 300,
                  width : 300,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30),

              // Instructions list
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.teal, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Show your identification clearly",
                      style: blackText16400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.teal, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Make sure it's not blurry",
                      style: blackText16400,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle, color: Colors.teal, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Place the ID until its edges is aligned",
                      style: blackText16400,
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Button
             

              customElevatedButton(
                title: "Got it, let’s scan",
                righticon: Icons.arrow_forward_ios,

                onPressed: () {
                  customNavigate(context, VerificationSuccessScreen());
                  // customNavigate(context, ScanDocumentDetailScreen());
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
