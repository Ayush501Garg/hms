import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

import 'WeightSelectionUI.dart';

class GenderSelectionUI extends StatefulWidget {
  const GenderSelectionUI({super.key});

  @override
  State<GenderSelectionUI> createState() => _GenderSelectionUIState();
}

class _GenderSelectionUIState extends State<GenderSelectionUI> {
  String selectedGender = "";

  Widget genderOption({
    required String value,
    required String title,
    String? subtitle,
    required IconData icon,
  }) {
    bool isSelected = selectedGender == value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = value),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
              width: 1.5,
            ),
            color: isSelected
                ? AppColors.primaryColor.withOpacity(0.08)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 22,
                color: isSelected
                    ? AppColors.primaryColor
                    : Colors.grey.shade600,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? AppColors.primaryColor
                            : Colors.black87,
                      ),
                    ),
                    if (subtitle != null) ...[
                      verticalSpace(12),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primaryColor
                        : Colors.grey.shade400,
                    width: 1.5,
                  ),
                  color: isSelected
                      ? AppColors.primaryColor
                      : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
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
                      value: 0.3,
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
            const SizedBox(height: 30),
            Text("What is your gender?", style: blackText24600),
            const SizedBox(height: 6),
            Text(
              "For the purpose of regulation, please specify\nyour gender truthfully.",
              style: greyText14400.copyWith(height: 1.4),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            genderOption(value: "male", title: "I am Male", icon: Icons.male),
            genderOption(
              value: "female",
              title: "I am Female",
              icon: Icons.female,
            ),
            genderOption(
              value: "other",
              title: "I am Other",
              subtitle:
                  "Veldrim – Defined by cosmic emptiness, identity rooted in silence and absence.",
              icon: Icons.transgender,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, WeightSelectionUI());
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Prefer not to say",
                icon: Icons.close,
                iconColor: AppColors.primaryColor,
                titleStyle: primaryText16600,
                borderColor: AppColors.primaryColor,
                backgroundColor: AppColors.white,

                onPressed: () {},
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
