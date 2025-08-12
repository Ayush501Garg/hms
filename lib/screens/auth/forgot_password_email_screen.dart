import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/core/app_images.dart';
import 'package:hms/screens/auth/password_reset_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart'; // for customElevatedButton

class ForgotPasswordEmailScreen extends StatelessWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            verticalSpace(20),

            /// Lock Image
            Image.asset(AppImages.lock, height: 200, width: 200),
            verticalSpace(30),

            /// Title
            Text(
              'Forgot Password',
              style: blackText24600,
              textAlign: TextAlign.center,
            ),
            verticalSpace(10),

            /// Subtitle
            Text(
              'Please enter your email address to reset your password.',
              style: greyText14400,
              textAlign: TextAlign.center,
            ),
            verticalSpace(30),

            /// Email Input
            TextFormField(
              controller: emailController,
              style: black87Text14400,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.greyColor,
                ),
                hintText: 'Enter your email address...',
                hintStyle: greyText14400,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.lightGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: AppColors.primaryColor),
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
            ),
            verticalSpace(30),

            /// Send Password Button using your customElevatedButton
            SizedBox(
              width: double.infinity,
              child: customElevatedButton(
                title: 'Send password',
                icon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, PasswordResetSentScreen());
                },
              ),
            ),
            verticalSpace(35),

            /// Footer Help Text
            Text("Don't remember your email?", style: greyText14400),
            verticalSpace(4),
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
                        // Handle email tap
                      },
                  ),
                ],
              ),
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}
