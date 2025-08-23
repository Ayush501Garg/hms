import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';

class CustomDatePickerField extends StatelessWidget {
  final DateTime? selectedDate;
  final String hint;
  final IconData icon;
  final VoidCallback onTap;
  final String? Function(String?)? validator;

  const CustomDatePickerField({
    Key? key,
    required this.selectedDate,
    required this.hint,
    required this.icon,
    required this.onTap,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            // labelText: label,
            hintText : hint,
            hintStyle: TextStyle(color: AppColors.primaryColor),
          
            // labelStyle: TextStyle(color: AppColors.primaryColor),
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(
               borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
            ),
          ),
        
          controller: TextEditingController(
            text: selectedDate == null
                ? ""
                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
          ),
          validator: validator,
        ),
      ),
    );
  }
}
