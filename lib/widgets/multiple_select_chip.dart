import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';

class MultiSelectChipsExample extends StatefulWidget {
  @override
  _MultiSelectChipsExampleState createState() => _MultiSelectChipsExampleState();
}

class _MultiSelectChipsExampleState extends State<MultiSelectChipsExample> {
  final List<String> allergies = ["Pollen", "Food", "Pet", "Insectal", "TP"];
  final List<String> selectedAllergies = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: allergies.map((allergy) {
        final isSelected = selectedAllergies.contains(allergy);
        return FilterChip(
          label: Text(allergy),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                selectedAllergies.add(allergy);
              } else {
                selectedAllergies.remove(allergy);
              }
            });
          },
          selectedColor: AppColors.mediumPrimaryColor,
          checkmarkColor: AppColors.primaryColor,
        );
      }).toList(),
    );
  }
}
