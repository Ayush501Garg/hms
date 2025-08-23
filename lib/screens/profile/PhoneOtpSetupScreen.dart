import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/profile/VerifyPasscodeScreen.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/custometextfield.dart';
import 'package:hms/widgets/switch_next_screen.dart';

class PhoneOtpSetupScreen extends StatelessWidget {
  PhoneOtpSetupScreen({super.key});

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),

                // Title
                Text("Phone OTP Setup", style: blackText24400),

                const SizedBox(height: 10),

                // Subtitle
                const Text(
                  "We’ll send a one time SMS message. Carrier\n"
                  "rates may apply on your location.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),

                const SizedBox(height: 30),

                // Lock Image
                Center(
                  child: Image.asset(
                    "assets/images/lock.png", // apni image yaha rakho
                    height: 180,
                  ),
                ),

                const SizedBox(height: 30),

                // Phone Input Field
                CustomIntlMobileField(
                  controller: phoneController,
                  hintText: "Mobile Number",
                  icon: Icons.phone,
                  initialCountryCode: "IN",
                  favoriteCountries: ["IN", "US", "MY"],
                  onChanged: (number) {
                    print("📱 User entered: $number");
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a valid mobile number";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Send OTP Button
                // SizedBox(
                //   width: double.infinity,
                //   height: 50,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.teal,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(12),
                //       ),
                //     ),
                //     onPressed: () {
                //       // button action
                //     },
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: const [
                //         Text(
                //           "Send OTP Code",
                //           style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                //         ),
                //         SizedBox(width: 8),
                //         Icon(Icons.arrow_forward, size: 20),
                //       ],
                //     ),
                //   ),
                // ),
                customElevatedButton(
                  title: "Send OTP Code",
                  righticon: Icons.arrow_forward,

                  onPressed: () {
                    customNavigate(context, VerifyPasscodeScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
