import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/profile/profile_identify_screen.dart';
import 'package:hms/screens/profile/upload_image_screen.dart';

import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class Profile_Intro_screen extends StatefulWidget {
  const Profile_Intro_screen({Key? key}) : super(key: key);

  @override
  State<Profile_Intro_screen> createState() => _Profile_Intro_screenState();
}

class _Profile_Intro_screenState extends State<Profile_Intro_screen> {
  int _currentStep = 0;

  final List<Map<String, dynamic>> steps = [
    {
      "title": "Let's Set Up Your Profile & Security",
      "subtitle":
          "Your health security is very important, and we don't share it with anyone.",
      "button": "I'm Ready",
      "icon": Icons.verified_user,
    },
    {
      "title": "Personal Information",
      "subtitle":
          "We’ll need your personal details to build a secure profile for you.",
      "button": "Next",
      "icon": Icons.person,
    },
    {
      "title": "All Set!",
      "subtitle":
          "Your profile is ready. Enjoy a secure and personalized experience.",
      "button": "Finish",
      "icon": Icons.check_circle,
    },
  ];

  void _nextStep() {
    if (_currentStep < steps.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {

      Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ProfileSetupScreen()));
      // MaterialPageRoute(builder: (context) => const Profile_Identify_screen()));
      // Last step reached -> Navigate to dashboard/home
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentStep + 1) / steps.length;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Stepper Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(steps.length, (index) {
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: index <= _currentStep
                            ? Colors.teal
                            : Colors.grey[300],
                        child: Icon(
                          steps[index]["icon"],
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        index == 0
                            ? "Assessment"
                            : index == 1
                            ? "Personal Info"
                            : "Completion",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: index <= _currentStep
                              ? Colors.teal
                              : Colors.grey,
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),

            // 🔹 Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                minHeight: 5,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            const SizedBox(height: 50),

            // 🔹 Icon
            Icon(steps[_currentStep]["icon"], size: 80, color: Colors.teal),
            const SizedBox(height: 30),

            // 🔹 Title
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                steps[_currentStep]["title"],
                style: blackText22400,
                textAlign: TextAlign.center,
              ),
            ),

            // 🔹 Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                steps[_currentStep]["subtitle"],
                style: greyText14400,
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(),

            // 🔹 Bottom Button
            // Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: ElevatedButton(
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.teal,
            //       minimumSize: const Size(double.infinity, 50),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     onPressed: _nextStep,
            //     child: Text(
            //       steps[_currentStep]["button"],
            //       style: whiteText18200
            //     ),
            //   ),
            // ),

            customElevatedButton(
              onPressed: _nextStep,
              child: Text(steps[_currentStep]["button"], style: whiteText18200),
            ),
            // hey rohit

            // 🔹 Optional Help Link
            TextButton(onPressed: () {}, child: const Text("I need help")),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
