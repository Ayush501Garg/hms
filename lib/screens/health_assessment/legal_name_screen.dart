import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/health_assessment/HealthGoalScreen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/utils/size_utils.dart';

class LegalNameScreen extends StatelessWidget {
  const LegalNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),

            /// Top bar with progress and skip
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

            const Spacer(),

            /// Title
            Center(
              child: Text(
                "What’s your full legal\nname?",
                style: blackText24600,
                textAlign: TextAlign.center,
              ),
            ),

            verticalSpace(50),

            /// Input field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter your name...",
                  hintStyle: greyText14400,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1.5,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),

            verticalSpace(20),

            /// Info text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "For regulatory purposes, please enter name stated on your state ID.",
                style: greyText14400,
                textAlign: TextAlign.center,
              ),
            ),

            verticalSpace(50),

            /// Continue button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, HealthGoalScreen());
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
