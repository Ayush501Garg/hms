import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/health_assessment/BirthDateScreen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class HealthGoalScreen extends StatefulWidget {
  const HealthGoalScreen({super.key});

  @override
  State<HealthGoalScreen> createState() => _HealthGoalScreenState();
}

class _HealthGoalScreenState extends State<HealthGoalScreen> {
  String selectedGoal = "Track my health metrics";

  final List<Map<String, dynamic>> goals = [
    {"icon": Icons.favorite_border, "text": "Improve my overall health"},
    {
      "icon": Icons.health_and_safety_outlined,
      "text": "Track my health metrics",
    },
    {"icon": Icons.medical_services_outlined, "text": "Manage my meds"},
    {"icon": Icons.local_pharmacy_outlined, "text": "I want E-Pharmacy"},
    {"icon": Icons.psychology_outlined, "text": "I want wellness AI assistant"},
    {"icon": Icons.explore_outlined, "text": "Just wanna try the app"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Progress bar and Skip
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.3, // Adjust step progress
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
                  child: Text("Skip", style: primaryText16600),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Title
            Align(
              alignment: Alignment.center,
              child: Text(
                textAlign: TextAlign.center,
                "What is your health goal\nfor the app?",
                style: blackText24600,
              ),
            ),

            verticalSpace(40),
            // Goals List
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20),
                itemCount: goals.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  final isSelected = selectedGoal == goal["text"];

                  return InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        selectedGoal = goal["text"];
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.greyColor.withOpacity(0.4),
                          width: 1.5,
                        ),
                        color: isSelected
                            ? AppColors.primaryColor.withOpacity(0.1)
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            goal["icon"],
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              goal["text"],
                              style: isSelected
                                  ? primaryText16600
                                  : blackText16400,
                            ),
                          ),
                          Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: isSelected
                                ? AppColors.primaryColor
                                : AppColors.greyColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, BirthDateScreen());
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
