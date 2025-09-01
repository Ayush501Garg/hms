import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/specify_medications_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class MedicationScreen extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
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
                      onTap: () {
                        popScreen(context);
                      },
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
                          value: 0.8, // Adjust progress as needed
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

              // Question and subtitle
              const Text(
                "Are you currently taking any medications?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "We are asking this to get accurate result.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),

              // Medication image
              Image.asset(
                "assets/images/medications.jpg", // Replace with your image
                height: 200,
              ),
              const SizedBox(height: 40),

              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // Yes button
                    customElevatedButton(
                      title: "Yes, I take it",
                      righticon: Icons.arrow_forward,
                      onPressed: () {
                        // Navigate to next screen or medication input
                        pushScreen(context, SpecifyMedicationsScreen());
                      },
                    ),
                    const SizedBox(height: 15),
                    // No button (outlined)
                    customOutlinedButton(
                      title: "Nope, I don't take it",
    
                      onPressed: () {
                        // Navigate to next screen
                        
                      },
                      // isOutlined: true,
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
