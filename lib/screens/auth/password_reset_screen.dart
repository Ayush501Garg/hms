import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_images.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class PasswordResetSentScreen extends StatelessWidget {
  const PasswordResetSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Envelope image
            Image.asset(AppImages.mail, height: 150),
            verticalSpace(40),

            // Title
            Text(
              'Password Reset Sent',
              style: blackText24600,
              textAlign: TextAlign.center,
            ),
            verticalSpace(12),

            // Description
            Text(
              "Please check your email in a few minutes - we've sent you an email containing password recovery link.",
              style: greyText14400,
              textAlign: TextAlign.center,
            ),
            verticalSpace(32),

            // Open email button
            SizedBox(
              width: double.infinity,
              child: customElevatedButton(
                title: "Open my email",
                icon: Icons.email_outlined,
                onPressed: () {
                  // Handle open email
                },
              ),
            ),
            verticalSpace(50),

            // Didn't receive email
            Text("Didn't receive the email?", style: greyText14400),
            verticalSpace(6),

            // Contact us RichText
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: 'Contact us at ', style: greyText14400),
                  TextSpan(
                    text: 'help@nightingale.ai',
                    style: primaryText14400.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Handle email click
                      },
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace(40),
          ],
        ),
      ),
    );
  }
}
