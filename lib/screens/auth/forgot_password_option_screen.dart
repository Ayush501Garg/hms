import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/core/app_images.dart';
import 'package:hms/screens/auth/forgot_password_email_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/utils/size_utils.dart';

class ForgotPasswordOptionScreen extends StatelessWidget {
  const ForgotPasswordOptionScreen({super.key});

  Widget _buildOption({
    IconData? icon, // Optional Material Icon
    String? imageAsset, // Optional asset image
    required Color iconBgColor,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.grey5,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightGrey),
        ),
        child: Row(
          children: [
            imageAsset != null
                ? Image.asset(imageAsset, width: 50, height: 50)
                : Icon(icon, color: AppColors.primaryColor, size: 20),
            horizontalSpace(12),
            Expanded(child: Text(title, style: blackText16600)),
            Icon(Icons.arrow_forward_ios, color: AppColors.greyColor, size: 20),
          ],
        ),
      ),
    );
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            Text('Forgot Password', style: blackText24600),
            verticalSpace(10),
            Text(
              'Please select the following options to reset your password.',
              style: greyText16400,
            ),
            verticalSpace(50),

            /// Email Option
            _buildOption(
              imageAsset: AppImages.emailIcon,
              iconBgColor: AppColors.lightprimaryColor,
              title: 'Send via Email',
              onTap: () {
                pushScreen(context, ForgotPasswordEmailScreen());
              },
            ),
            verticalSpace(16),

            /// SMS Option
            _buildOption(
              imageAsset: AppImages.smsIcon,
              iconBgColor: AppColors.lightRed,
              title: 'Send via SMS',
              onTap: () {},
            ),
            verticalSpace(16),

            /// 2FA Option
            _buildOption(
              imageAsset: AppImages.twoFAIcon,
              iconBgColor: AppColors.lightOrange,
              title: 'Send via 2FA',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
