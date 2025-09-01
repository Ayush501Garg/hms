import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/smoking_question_screen.dart';
import '../../utils/navigation_utils.dart';
import '../../widgets/custome_button.dart';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  int selectedLevel = 3;

  final Map<int, Map<String, String>> sleepLevels = {
    1: {"title": "Very Poor", "subtitle": "I sleep less than 4 hours"},
    2: {"title": "Poor", "subtitle": "I sleep 4–5 hours only"},
    3: {"title": "Fair", "subtitle": "I sleep 5–6 hours only"},
    4: {"title": "Moderate", "subtitle": "I sleep 6–7 hours only"},
    5: {"title": "Good", "subtitle": "I sleep 7–8 hours"},
  };

  @override
  Widget build(BuildContext context) {
    var levelInfo = sleepLevels[selectedLevel]!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 🔹 Header
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

            const SizedBox(height: 30),

            // 🔹 Title
            const Text(
              "How would you rate\nyour sleep level?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 50),

            // 🔹 Big Number
            Text(
              "$selectedLevel",
              style: const TextStyle(
                fontSize: 80,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),

            const SizedBox(height: 10),

            // 🔹 Sleep Title
            Text(
              levelInfo["title"]!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Level Buttons (1–5)
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: List.generate(5, (index) {
                  int level = index + 1;
                  bool isSelected = selectedLevel == level;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLevel = level;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "$level",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected
                                ? Colors.black
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Subtitle (hours of sleep)
            Text(
              levelInfo["subtitle"]!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),

            const Spacer(),

            // 🔹 Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, SmokingQuestionScreen());
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
