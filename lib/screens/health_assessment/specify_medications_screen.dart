import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/ongoing_allergy_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custom_radio_button.dart';
import 'package:hms/widgets/custome_button.dart';

class SpecifyMedicationsScreen extends StatefulWidget {
  @override
  _SpecifyMedicationsScreenState createState() =>
      _SpecifyMedicationsScreenState();
}

class _SpecifyMedicationsScreenState extends State<SpecifyMedicationsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Map<String, dynamic>> _medications = [
    {"name": "Aspirin", "isSelected": false},
    {"name": "Amoxicillin", "isSelected": false},
    {"name": "Atorvastatin", "isSelected": false},
    {"name": "Allopurinol", "isSelected": false},
    {"name": "Acetaminophen", "isSelected": false},
    {"name": "Amitriptyline", "isSelected": false},
  ];

  List<String> _selectedMedications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top bar with back, progress, and skip
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => popScreen(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: LinearProgressIndicator(
                            value: 0.9,
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
                          color: Color(0xFF14B8A6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
        
                // Title
                const Text(
                  "Please specify your medications, then.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
        
                // Search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      // ✅ added border
                      color: Colors.grey.shade400,
                      width: 0.5,
                    ),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      hintText: "Search medication...",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                    onChanged: (value) {
                      // Implement search functionality here
                    },
                  ),
                ),
        
                const SizedBox(height: 20),
        
                // Medications list
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 0.5),
                  ),
                  child: ListView.builder(
                    itemCount: _medications.length,
                    itemBuilder: (context, index) {
                      final medication = _medications[index];
                      return CircleCheckboxListTile(
                        title: medication["name"],
                        value: medication["isSelected"],
                        onChanged: (bool? newValue) {
                          setState(() {
                            _medications[index]["isSelected"] = newValue!;
                            if (newValue) {
                              _selectedMedications.add(medication["name"]);
                            } else {
                              _selectedMedications.remove(medication["name"]);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
        
                // Selected medications
                if (_selectedMedications.isNotEmpty) ...[
                  const Text(
                    "Selected:",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: _selectedMedications.map((medication) {
                      return Chip(
                        label: Text(medication),
                        onDeleted: () {
                          setState(() {
                            _selectedMedications.remove(medication);
                            _medications.firstWhere(
                              (m) => m["name"] == medication,
                            )["isSelected"] = false;
                          });
                        },
                        deleteIcon: const Icon(Icons.close, size: 16),
                        backgroundColor: Colors.grey[100],
                        labelStyle: const TextStyle(fontSize: 12),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
        
                // Continue button
                customElevatedButton(
                  title: "Continue",
                  righticon: Icons.arrow_forward,
                  onPressed: () {
                    // Navigate to next screen
                    pushScreen(context, OngoingAllergyScreen());
                  },
                  backgroundColor: const Color(0xFF14B8A6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
