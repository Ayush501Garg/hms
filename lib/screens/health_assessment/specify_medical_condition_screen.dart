import 'package:flutter/material.dart';
import 'package:hms/screens/health_assessment/health_checkup_frequency_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class SpecifyMedicalConditionScreen extends StatefulWidget {
  @override
  _SpecifyMedicalConditionScreenState createState() =>
      _SpecifyMedicalConditionScreenState();
}

class _SpecifyMedicalConditionScreenState
    extends State<SpecifyMedicalConditionScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _allConditions = [
    "Hypertension",
    "Asthma",
    "Allergies",
    "Arthritis",
    "Obesity",
    "Depression",
    "Cholesterol",
    "Diabetes",
    "Anxiety",
    "Migraine",
    "Thyroid",
    "Heart Disease",
  ];
  List<String> _filteredConditions = [];
  List<String> _selectedConditions = [];

  @override
  void initState() {
    super.initState();
    _filteredConditions = _allConditions;
    _searchController.addListener(_filterConditions);
  }

  void _filterConditions() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredConditions = _allConditions.where((condition) {
        return condition.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                          value: 0.9, // Adjust as needed
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
                "Please specify your medical condition",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

              // Most Common label and Search
              Row(
                children: [
                  const Text(
                    "Most Common",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const Spacer(),
                  Container(
                    width: 120,
                    height: 35,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 18,
                          color: Colors.grey,
                        ),
                        hintText: "Search",
                        hintStyle: const TextStyle(fontSize: 12),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Medical conditions grid
              Expanded(
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _filteredConditions.map((condition) {
                    final isSelected = _selectedConditions.contains(condition);
                    return InputChip(
                      label: Text(condition),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedConditions.add(condition);
                          } else {
                            _selectedConditions.remove(condition);
                          }
                        });
                      },
                      selectedColor: const Color(0xFF14B8A6).withOpacity(0.1),
                      labelStyle: TextStyle(
                        color: isSelected
                            ? const Color(0xFF14B8A6)
                            : Colors.black87,
                        fontSize: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? const Color(0xFF14B8A6)
                              : Colors.grey[300]!,
                          width: 1.0,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      // Remove these properties to hide icons:
                      showCheckmark: false,
                      deleteIcon: null,
                      onDeleted: null,
                    );
                  }).toList(),
                ),
              ),

              // Selected conditions
              if (_selectedConditions.isNotEmpty) ...[
                const SizedBox(height: 10),
                const Text(
                  "Selected:",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _selectedConditions.map((condition) {
                    return Chip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(condition),
                          const SizedBox(width: 4),
                          const Icon(Icons.close, size: 14),
                        ],
                      ),
                      onDeleted: () {
                        setState(() {
                          _selectedConditions.remove(condition);
                        });
                      },
                      deleteIcon: const Icon(Icons.close, size: 14),
                      backgroundColor: Colors.grey[100],
                      labelStyle: const TextStyle(fontSize: 12),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 15),
              ],

              // Continue button
              customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: _selectedConditions.isNotEmpty
                    ? () {
                        // Navigate to next screen
                        pushScreen(context, HealthCheckupFrequencyScreen());
                      }
                    : null,
                backgroundColor: const Color(0xFF14B8A6),
              ),
              const SizedBox(height: 10),

              // I don't have any button
              customOutlinedButton(
                title: "I don't have any",
                onPressed: () {
                  // Navigate to next screen
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
