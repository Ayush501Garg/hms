import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/screens/profile/ScanIdScreen.dart';
import 'package:hms/widgets/custom_toastification.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/switch_next_screen.dart';
import 'package:pinput/pinput.dart';
import 'package:toastification/toastification.dart'; // OTP box ke liye best package

class VerifyPasscodeScreen extends StatefulWidget {
  @override
  State<VerifyPasscodeScreen> createState() => _VerifyPasscodeScreenState();
}

class _VerifyPasscodeScreenState extends State<VerifyPasscodeScreen> {
  String otpCode = "";
  final String correctOtp = "1234";

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 60,
      textStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Title
              const Text(
                "Verify your Passcode",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),

              // OTP Input
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                showCursor: true,
                onCompleted: (pin) {
                  print("Entered OTP: $pin");
                },
                onChanged: (value) {
                  setState(() {
                    otpCode = value;
                  });
                },
              ),

              const SizedBox(height: 20),

              // Subtext
              const Text(
                "We’ve sent a code to +91****. Please enter it\nhere to verify your identity.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 15),

              // Resend OTP link
              TextButton(
                onPressed: () {
                  print("Resend OTP tapped");
                },
                child: const Text(
                  "Didn’t Receive? Re-Send OTP",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward_ios,
                backgroundColor: otpCode == correctOtp
                    ? AppColors.primaryColor
                    : AppColors.greyColor,

                onPressed: otpCode == correctOtp
                    ? () {
                      showToast(context, "OTP Verified ");
                      customNavigate(context, ScanIdScreen());

                        print("check otp  $otpCode");
                      }
                    : null,
              ),

              const SizedBox(height: 15),

              // Secondary Button (Outlined)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.email_outlined, color: Colors.teal),
                  label: const Text(
                    "Email the code instead",
                    style: TextStyle(color: Colors.teal),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.teal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    // handle email option
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
