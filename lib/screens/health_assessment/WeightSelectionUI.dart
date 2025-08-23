import 'package:flutter/material.dart';
import 'package:flutter_ruler_picker/flutter_ruler_picker.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

import '../../utils/navigation_utils.dart';
import 'HeightSelectionUI.dart';

class WeightSelectionUI extends StatefulWidget {
  const WeightSelectionUI({super.key});

  @override
  State<WeightSelectionUI> createState() => _WeightSelectionUIState();
}

class _WeightSelectionUIState extends State<WeightSelectionUI> {
  String selectedUnit = "lbs";
  num weight = 140;

  late RulerPickerController _rulerController;
  List<RulerRange> ranges = const [RulerRange(begin: 80, end: 300, scale: 1)];

  @override
  void initState() {
    super.initState();
    _rulerController = RulerPickerController(value: weight);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🔹 Header with back, progress bar, skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: LinearProgressIndicator(
                        value: 0.3,
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
           Spacer(),

            // 🔹 Title
             Text(
              "What is your weight?",
              style:blackText24600,
            ),

          verticalSpace(60),

            // 🔹 lbs/kg toggle
            Container(
              width: screenWidth(context)*0.8,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [_unitButton("lbs"), _unitButton("kg")],
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Big number
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  weight.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  selectedUnit,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // 🔹 Ruler Picker
            SizedBox(
              height: 120,
              child: RulerPicker(
                controller: _rulerController,
                ranges: ranges,
                onValueChanged: (value) {
                  setState(() => weight = value);
                },
                onBuildRulerScaleText: (index, value) {
                  if (value % 10 == 0) return value.toInt().toString();
                  return "";
                },
                width: MediaQuery.of(context).size.width,
                height: 80,
                rulerMarginTop: 8,
                scaleLineStyleList: const [
                  ScaleLineStyle(
                      color: Colors.grey, width: 2, height: 60, scale: 0),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1.5, height: 50, scale: 5),
                  ScaleLineStyle(
                      color: Colors.grey, width: 1.5, height: 30, scale: -1),
                ],
                marker: Container(
                  width: 5,
                  color: AppColors.primaryColor,
                ),
              ),
            ),

            verticalSpace(100),
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
            Spacer(),
          ],
        ),
      ),
    );
  }

  // 🔹 Custom Toggle
  Widget _unitButton(String unit) {
    bool isSelected = selectedUnit == unit;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (selectedUnit != unit) {
              if (unit == "kg") {
                weight = (weight * 0.453592).round();
                ranges = const [RulerRange(begin: 35, end: 150, scale: 1)];
              } else {
                weight = (weight / 0.453592).round();
                ranges = const [RulerRange(begin: 80, end: 300, scale: 1)];
              }
              _rulerController.value = weight;
              selectedUnit = unit;
            }
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
