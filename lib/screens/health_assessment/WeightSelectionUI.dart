import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';

import '../../widgets/custome_button.dart';

class WeightSelectionUI extends StatefulWidget {
  const WeightSelectionUI({super.key});

  @override
  State<WeightSelectionUI> createState() => _WeightSelectionUIState();
}

class _WeightSelectionUIState extends State<WeightSelectionUI> {
  String selectedUnit = "lbs";
  double weight = 140;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.4,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor,
                      ),
                      minHeight: 7,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Skip", style: primaryText16600),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Text("What is your weight?", style: blackText24600),
            const SizedBox(height: 20),

            // Toggle for lbs/kg
            Container(
              height: 40,
              width: 160,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(children: [_unitButton("lbs"), _unitButton("kg")]),
            ),

            const SizedBox(height: 30),

            // Weight Display
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  weight.toStringAsFixed(0),
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  selectedUnit,
                  style: const TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Horizontal ruler slider
            Expanded(
              child: RotatedBox(
                quarterTurns: -1,
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppColors.primaryColor.withOpacity(0.2),
                    inactiveTrackColor: Colors.grey.shade300,
                    trackHeight: 80,
                    thumbColor: AppColors.primaryColor,
                    overlayShape: SliderComponentShape.noOverlay,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                  ),
                  child: Slider(
                    min: 80,
                    max: 300,
                    value: weight,
                    onChanged: (val) => setState(() => weight = val),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _unitButton(String unit) {
    bool isSelected = selectedUnit == unit;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedUnit = unit),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            unit,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.black87 : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
