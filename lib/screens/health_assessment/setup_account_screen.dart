import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_images.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/health_assessment/legal_name_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class SetupAccountScreen extends StatelessWidget {
  const SetupAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              verticalSpace(40),

              /// Stepper with outlined circles and connecting lines
              Row(
                children: [
                  _buildStep(isActive: true, label: "Assessment"),
                  _buildLine(isActive: false),
                  _buildStep(isActive: false, label: "Personal Info"),
                  _buildLine(isActive: false),
                  _buildStep(isActive: false, label: "Choose Plan"),
                ],
              ),

              const Spacer(),

              /// Center logo/icon
              Image.asset(
                AppImages.logoGreen,
                height: 100,
                fit: BoxFit.contain,
              ),

              verticalSpace(32),

              /// Title
              Text(
                "Let's fully set up your\nnightingale account.",
                style: blackText24600,
                textAlign: TextAlign.center,
              ),

              verticalSpace(12),

              /// Subtitle
              Text(
                "Here’s what we’ll do over the next minutes.",
                style: greyText14400,
                textAlign: TextAlign.center,
              ),

              verticalSpace(50),

              /// Button
              SizedBox(
                width: double.infinity,
                child: customElevatedButton(
                  title: "I’m Ready",
                  righticon: Icons.arrow_forward,
                  onPressed: () {
                    pushScreen(context, LegalNameScreen());
                  },
                ),
              ),

              verticalSpace(16),

              /// Help link
              RichText(
                text: TextSpan(
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(
                        Icons.help_outline,
                        size: 18,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 6)),
                    TextSpan(
                      text: "I need help",
                      style: primaryText14600.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Handle help
                        },
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep({required bool isActive, required String label}) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive
                  ? AppColors.primaryColor
                  : AppColors.greyColor.withOpacity(0.4),
              width: 2,
            ),
            color: Colors.white,
          ),
          child: isActive
              ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                )
              : const SizedBox(),
        ),
        verticalSpace(6),
        Text(label, style: isActive ? blackText16600 : greyText14400),
      ],
    );
  }

  Widget _buildLine({required bool isActive}) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive
            ? AppColors.primaryColor
            : AppColors.greyColor.withOpacity(0.3),
      ),
    );
  }
}
