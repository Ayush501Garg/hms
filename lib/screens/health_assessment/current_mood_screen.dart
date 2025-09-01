import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/blood_type_screen.dart';
import 'package:hms/screens/health_assessment/eating_habits_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class CurrentMoodScreen extends StatefulWidget {
  @override
  _CurrentMoodScreenState createState() => _CurrentMoodScreenState();
}

class _CurrentMoodScreenState extends State<CurrentMoodScreen> {
  String selectedOption = "";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top bar
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      popScreen(context);
                    },
                    child: const Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.black),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LinearProgressIndicator(
                        value: 0.7,
                        color: const Color(0xFF14B8A6),
                        backgroundColor: Colors.grey.shade200,
                        minHeight: 3,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Text(
                    "Skip",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF14B8A6)),
                  ),
                ],
              ),
            ),
              SizedBox(height: 30),

              // Question
              Text(
                "What's your current\nmood right now ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              SizedBox(height: 20),

              // Cigarette Image
              // Image.asset(
              //   "assets/images/cigarette.jpg", // replace with your image asset
              //   height: 120,
              // ),
              SizedBox(height: 30),

                Text(
                "I'm feeling very happy",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey),
              ),
              SizedBox(height: 20),

              // Options
            
             
              Spacer(),



              // Continue Button
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, EatingHabitsScreen());
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
