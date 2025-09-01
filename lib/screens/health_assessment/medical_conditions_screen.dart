import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/specify_medical_condition_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class MedicalConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top bar with back, progress, and skip
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => popScreen(context),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: LinearProgressIndicator(
                          value: 0.85, // Adjust as needed
                          color: const Color(0xFF14B8A6),
                          backgroundColor: Colors.grey.shade200,
                          minHeight: 3,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14B8A6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Question
              const Text(
                "Do you have any medical conditions?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Hospital bed image
              Image.asset(
                "assets/images/hospital_bed.jpg", // Replace with your image
                height: 250,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 40),

              Spacer(),

              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // Yes button (filled)
                    customElevatedButton(
                      title: "Yes, I have them",
                      righticon: Icons.arrow_forward,
                      onPressed: () {
                        // Navigate to medical conditions selection screen
                        pushScreen(context, SpecifyMedicalConditionScreen());
                      },
                      backgroundColor: const Color(0xFF14B8A6),
                    ),
                    const SizedBox(height: 15),
                    // No button (outlined)
                    customOutlinedButton(
                      title: " I don't have any",
                      onPressed: () {
                        // Navigate to next screen
                      },
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
}
