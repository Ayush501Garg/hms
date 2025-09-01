import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/utils/navigation_utils.dart';

class BodyAnalysisScreen extends StatefulWidget {
  const BodyAnalysisScreen({super.key});

  @override
  State<BodyAnalysisScreen> createState() => _BodyAnalysisScreenState();
}

class _BodyAnalysisScreenState extends State<BodyAnalysisScreen> {
  // Track which checklist items are checked
  final Map<int, bool> _checklistItems = {
    0: false, // Brightly lit room
    1: false, // Hi resolution camera
    2: false, // Clear body pose
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top bar with progress and skip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.6, // Adjust as needed
                          backgroundColor: Colors.grey.shade200,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.primaryColor,
                          ),
                          minHeight: 7,
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Title and subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Body Analysis",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Now we'll scan your body for better assessment. Please ensure the following",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Human body image
            Center(
              child: Image.asset(
                "assets/images/body_analysis.jpg",  // Replace with your image
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 30),
            // const Spacer(),

            // Checklist items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildChecklistItem(
                    0,
                    "Brightly lit room and environment",
                  ),
                  const SizedBox(height: 12),
                  _buildChecklistItem(
                    1,
                    "Hi resolution camera capture",
                  ),
                  const SizedBox(height: 12),
                  _buildChecklistItem(
                    2,
                    "Clear body pose & anatomy",
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Continue button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  // Check if all items are checked
                  if (_checklistItems.values.every((isChecked) => isChecked)) {
                      // pushScreen(context, BodyAnalysisScreen());
                    // Navigate to next screen
                  } else {
                    // Show message to check all items
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please ensure all conditions are met"),
                      ),
                    );
                  }
                },
                backgroundColor: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build checklist items
  Widget _buildChecklistItem(int index, String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _checklistItems[index] = !_checklistItems[index]!;
        });
      },
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _checklistItems[index]!
                    ? AppColors.primaryColor
                    : Colors.grey,
                width: 2,
              ),
              color: _checklistItems[index]!
                  ? AppColors.primaryColor
                  : Colors.white,
            ),
            child: _checklistItems[index]!
                ? const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
