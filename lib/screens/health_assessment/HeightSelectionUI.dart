import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';

import '../../utils/navigation_utils.dart';
import '../../widgets/custome_button.dart';

class HeightSelectionUI extends StatefulWidget {
  const HeightSelectionUI({super.key});

  @override
  State<HeightSelectionUI> createState() => _HeightSelectionUIState();
}

class _HeightSelectionUIState extends State<HeightSelectionUI> {
  String selectedUnit = "cm";
  int height = 162;

  FixedExtentScrollController cmController = FixedExtentScrollController(initialItem: 82); // 162cm
  FixedExtentScrollController inchController = FixedExtentScrollController(initialItem: 65); // 65in

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
                      onTap : (){
                        popScreen(context);
                      },
                      child: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black)),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LinearProgressIndicator(
                        value: 0.4,
                        color: const Color(0xFF14B8A6),
                        backgroundColor: Colors.grey.shade200,
                        minHeight: 3,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const Text("Skip",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF14B8A6))),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 Title
             Text(
              "What is your height?",
              style:blackText24600,
            ),

            const SizedBox(height: 20),

            // 🔹 cm / inch toggle
            Container(
              width: screenWidth(context)*0.8,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [_unitButton("cm"), _unitButton("inch")],
              ),
            ),

            const SizedBox(height: 30),

            // 🔹 Picker with highlighted middle
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CupertinoPicker(
                    scrollController: selectedUnit == "cm"
                        ? cmController
                        : inchController,
                    itemExtent: 60,
                    useMagnifier: false,
                    squeeze: 1.0,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        if (selectedUnit == "cm") {
                          height = 100 + index; // 80–250 cm
                        } else {
                          height = 50 + index; // 30–100 inches
                        }
                      });
                    },
                    children: List.generate(
                      selectedUnit == "cm" ? 171 : 71,
                          (index) => Center(
                        child: Text(
                          "${selectedUnit == "cm" ? 80 + index : 30 + index}",
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // 🔹 Highlight Box
                  Container(
                    height: screenHeight(context)*0.1,
                    width: screenWidth(context)*0.8,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F9F6),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: const Color(0xFF14B8A6), width: 2),
                    ),
                    child: Center(
                      child: Text(
                        "$height",
                        style: const TextStyle(
                          fontSize: 70,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF14B8A6),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            // 🔹 Continue Button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, HeightSelectionUI());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Unit Toggle Button
  Widget _unitButton(String unit) {
    bool isSelected = selectedUnit == unit;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedUnit = unit;
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
            unit,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.black : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
