import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/blood_type_screen.dart';
import 'package:hms/screens/health_assessment/current_mood_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class SmokingQuestionScreen extends StatefulWidget {
  @override
  _SmokingQuestionScreenState createState() => _SmokingQuestionScreenState();
}

class _SmokingQuestionScreenState extends State<SmokingQuestionScreen> {
  String selectedOption = "";

  final List<Map<String, String>> options = [
    {"title": "Yes, I smoke them", "subtitle": "I smoke them daily"},
    {"title": "Sometimes", "subtitle": "I smoked a few months"},
    {"title": "No, I don’t", "subtitle": "I never smoked in my life"},
  ];

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
                "Do you smoke any\ncigarettes?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
              ),
              SizedBox(height: 20),

              // Cigarette Image
              Image.asset(
                "assets/images/cigarette.jpg", // replace with your image asset
                height: 120,
              ),
              SizedBox(height: 30),

              // Options
              Column(
                children: options.map((option) {
                  bool isSelected = selectedOption == option["title"];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = option["title"]!;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.teal.withOpacity(0.1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? Colors.teal : Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(option["title"]!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87)),
                                SizedBox(height: 4),
                                Text(option["subtitle"]!,
                                    style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54)),
                              ],
                            ),
                          ),
                          Icon(
                            isSelected
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: isSelected ? Colors.teal : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              Spacer(),



              // Continue Button
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, CurrentMoodScreen());
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
