import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/AthleticScreen.dart';
import '../../utils/navigation_utils.dart';
import '../../widgets/custome_button.dart';

class BloodTypeScreen extends StatefulWidget {
  const BloodTypeScreen({super.key});

  @override
  State<BloodTypeScreen> createState() => _BloodTypeScreenState();
}

class _BloodTypeScreenState extends State<BloodTypeScreen> {
  String selectedGroup = "A";
  String selectedSign = "+";

  final List<String> bloodGroups = ["A", "B", "AB", "O"];
  final List<String> signs = ["+", "-"];

  @override
  Widget build(BuildContext context) {
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
                        value: 0.5,
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

            const SizedBox(height: 20),

            // 🔹 Title
            const Text(
              "What’s your official\nblood type?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Blood group selection
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: bloodGroups.map((group) {
                  bool isSelected = selectedGroup == group;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGroup = group;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          group,
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
                }).toList(),
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Large Display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedGroup,
                  style: const TextStyle(
                    fontSize: 120,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF4C5E),
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    selectedSign,
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 🔹 Sign Buttons (+ / -)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: signs.map((sign) {
                bool isSelected = selectedSign == sign;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSign = sign;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 120,
                    height : 50,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFE6F9F6)
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? const Color(0xFF14B8A6)
                            : Colors.grey.shade400,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        sign,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color:
                              isSelected ? const Color(0xFF14B8A6) : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            const Spacer(),

            // 🔹 Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, AthleticScreen());
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
