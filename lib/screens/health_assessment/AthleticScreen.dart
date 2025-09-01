import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/sleep_screen.dart';
import '../../utils/navigation_utils.dart';
import '../../widgets/custome_button.dart';

class AthleticScreen extends StatefulWidget {
  const AthleticScreen({super.key});

  @override
  State<AthleticScreen> createState() => _AthleticScreenState();
}

class _AthleticScreenState extends State<AthleticScreen> {
  double fitnessLevel = 4; // Default level

  // Mapping levels to descriptions
  final Map<int, Map<String, String>> fitnessDescriptions = {
    1: {"title": "Beginner", "subtitle": "Little to no exercise"},
    2: {"title": "Casual", "subtitle": "Exercise 1–2 times weekly"},
    3: {"title": "Active", "subtitle": "Exercise 2–3 times weekly"},
    4: {"title": "Athletic", "subtitle": "Exercise 3–4 times weekly"},
    5: {"title": "Advanced", "subtitle": "Exercise 4–5 times weekly"},
    6: {"title": "Pro", "subtitle": "Exercise 6+ times weekly"},
  };

  @override
  Widget build(BuildContext context) {
    int currentLevel = fitnessLevel.round();
    var levelInfo = fitnessDescriptions[currentLevel]!;

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
                        value: 0.6,
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
              "How would you rate\nyour fitness level?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Slider with color bar
            Column(
              children: [
                Text(
                  "LEVEL $currentLevel",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF14B8A6),
                  ),
                ),
                const SizedBox(height: 10),
                SliderTheme(
                  
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.teal, 
                    overlayColor: Colors.teal.withOpacity(0.2),  
                    trackHeight: 30,
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 14),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 22),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Gradient background bar
                      Container(
                        height: 30,
                        margin: const EdgeInsets.symmetric(horizontal: 22),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.orange,
                              Colors.yellow,
                              Colors.green,
                              Colors.teal,
                              Colors.blue
                            ],
                          ),
                        ),
                      ),
                      Slider(
                        value: fitnessLevel,
                        inactiveColor: Colors.white,
                        min: 1,
                        max: 6,
                        divisions: 5,
                        onChanged: (value) {
                          setState(() {
                            fitnessLevel = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // 🔹 Fitness description
            Text(
              levelInfo["title"]!,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              levelInfo["subtitle"]!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "🔘 Drag the slider to adjust",
              style: TextStyle(
                fontSize: 14,
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
                  pushScreen(context, SleepScreen());
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
