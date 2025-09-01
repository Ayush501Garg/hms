import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/medical_conditions_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class OngoingAllergyScreen extends StatefulWidget {
  @override
  _OngoingAllergyScreenState createState() => _OngoingAllergyScreenState();
}

class _OngoingAllergyScreenState extends State<OngoingAllergyScreen> {
  String? _selectedAllergy;

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
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
                "Do you have any ongoing allergy?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Virus image
              Image.asset(
                "assets/images/virus.jpg", // Replace with your virus/allergy image
                height: 150,
              ),
              const SizedBox(height: 30),

              // Allergy options
              // Allergy options (flexible and scrollable)
              Container(
                height : 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF14B8A6),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAllergyChip("Nuts"),
                          const SizedBox(width: 8),
                          _buildAllergyChip("Bread"),
                          const SizedBox(width: 8),
                          _buildAllergyChip("Dairy"),
                          const SizedBox(width: 8),
                          _buildAllergyChip("Pollut"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Other option
              const SizedBox(height: 30),

             Spacer(),

              // Continue button
              customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: _selectedAllergy != null
                    ? () {
                      
                      pushScreen(context, MedicalConditionsScreen());
                        // Navigate to next screen
                      }
                    : null,
                backgroundColor: const Color(0xFF14B8A6),
              ),
              const SizedBox(height: 15),

              // I don't have any button
              customOutlinedButton(
                title: "I don't have any",
                onPressed: () {
                  // Navigate to next screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllergyChip(String label) {
    return FilterChip(
      label: Text(label),
      selected: _selectedAllergy == label,
      onSelected: (bool selected) {
        setState(() {
          _selectedAllergy = selected ? label : null;
        });
      },
      selectedColor: const Color(0xFF14B8A6).withOpacity(0.1),
      checkmarkColor: const Color(0xFF14B8A6),
      labelStyle: TextStyle(
        color: _selectedAllergy == label
            ? const Color(0xFF14B8A6)
            : Colors.black87,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: _selectedAllergy == label
              ? const Color(0xFF14B8A6)
              : Colors.grey[300]!,
        ),
      ),
      backgroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    );
  }
}
