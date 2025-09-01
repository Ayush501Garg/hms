import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/medication_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class EatingHabitsScreen extends StatefulWidget {
  @override
 _EatingHabitsScreenState createState() => _EatingHabitsScreenState();
}

class _EatingHabitsScreenState extends State<EatingHabitsScreen> {
  String? selectedOption;

  @override
 Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Colors.white,
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [

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
             // Question
             const Text(
               "What is your usual eating habits?",
               textAlign: TextAlign.center,
               style: TextStyle(
                 fontSize: 24,
                 fontWeight: FontWeight.w600,
                 color: Colors.black87,
               ),
             ),
             const SizedBox(height: 40),

             // Options Grid
             Expanded(
               child: GridView.count(
                 crossAxisCount: 2,
                 childAspectRatio: 0.85,
                 crossAxisSpacing: 15,
                 mainAxisSpacing: 15,
                 children: [
                   // Balanced Diet
                   _buildOptionCard(
                     icon: Icons.restaurant,
                     title: "Balanced Diet",
                     subtitle: "Increasing a very balanced diet",
                     isSelected: selectedOption == "Balanced Diet",
                     onTap: () {
                       setState(() {
                         selectedOption = "Balanced Diet";
                       });
                     },
                   ),

                   // Vegetarian
                   _buildOptionCard(
                     icon: Icons.eco,
                     title: "Vegetarian",
                     subtitle: "I was a totbit or my previous trip",
                     isSelected: selectedOption == "Vegetarian",
                     onTap: () {
                       setState(() {
                         selectedOption = "Vegetarian";
                       });
                     },
                   ),

                   // Low Carb
                   _buildOptionCard(
                     icon: Icons.no_food,
                     title: "Low Carb",
                     subtitle: "I am allergic to carbohydrates",
                     isSelected: selectedOption == "Low Carb",
                     onTap: () {
                       setState(() {
                         selectedOption = "Low Carb";
                       });
                     },
                   ),

                   // Gluten-Free
                   _buildOptionCard(
                     icon: Icons.grain,
                     title: "Gluten-Free",
                     subtitle: "I have gluten with all of my life",
                     isSelected: selectedOption == "Gluten-Free",
                     onTap: () {
                       setState(() {
                         selectedOption = "Gluten-Free";
                       });
                     },
                   ),
                 ],
               ),
             ),

             // Continue Button
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10),
               child: customElevatedButton(
                 title: "Continue",
                 righticon: Icons.arrow_forward,
                 onPressed: selectedOption != null
                     ? () {
                         // Navigate to next screen
                          pushScreen(context, MedicationScreen());
                       }
                     : null,
               ),
             ),
             const SizedBox(height: 20),
           ],
         ),
       ),
     ),
   );
 }

  // Helper method to build option cards
  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF14B8A6).withOpacity(0.1) : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF14B8A6) : Colors.grey[300]!,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 36, color: isSelected ? const Color(0xFF14B8A6) : Colors.grey),
              const SizedBox(height: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
