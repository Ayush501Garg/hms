import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/screens/health_assessment/body_analysis_screen.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/utils/navigation_utils.dart';

class HealthCheckupFrequencyScreen extends StatefulWidget {
  const HealthCheckupFrequencyScreen({super.key});

  @override
  State<HealthCheckupFrequencyScreen> createState() => _HealthCheckupFrequencyScreenState();
}

class _HealthCheckupFrequencyScreenState extends State<HealthCheckupFrequencyScreen> {
  int selectedIndex = 2; // Default to "Monthly" (index 2)
  final List<String> frequencies = const [
    "Weekly",
    "Bi-weekly",
    "Monthly",
    "Bi-monthly",
    "Yearly",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Top bar with back, progress, skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: LinearProgressIndicator(
                        value: 0.5, // Adjust as needed
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primaryColor,
                        ),
                        minHeight: 7,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Question
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "How often do you do health checkup?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Scrollable frequency picker (using ListWheelScrollView like in your example)
            SizedBox(
              height: 280,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Highlight selection box
                  Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor.withOpacity(0.05),
                    ),
                  ),
                  // Frequency Picker
                  ListWheelScrollView.useDelegate(
                    itemExtent: 40,
                    perspective: 0.009,
                    diameterRatio: 3,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      setState(() => selectedIndex = index);
                    },
                    controller: FixedExtentScrollController(
                      initialItem: selectedIndex,
                    ),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: frequencies.length,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            frequencies[index],
                            style: selectedIndex == index
                                ? const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.primaryColor,
                                  )
                                : const TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  // Navigate to next screen
                  pushScreen(context, BodyAnalysisScreen());
                },
              ),
            ),

            // "I never do health checkup" option
            TextButton(
              onPressed: () {
                // Handle "never" selection
              },
              child: const Text(
                "I never do health checkup",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
