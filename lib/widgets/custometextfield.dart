import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomTextField extends StatefulWidget {
  final IconData? icon;
  final String hintText;
  final TextInputType inputType;
  final bool isPassword;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator; // ✅ validator add
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final int maxLines;
  final int minLines;
  // final TextStyle? style;

  const CustomTextField({
    Key? key,
    this.icon,
    required this.hintText,
    required this.inputType,
    this.isPassword = false,
    required this.controller,
    this.onChanged,
    this.validator, // ✅ constructor me bhi add
    this.margin,
    this.padding,
    this.maxLines = 2,
    this.minLines = 1, 
    // this.style,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: TextFormField(
        controller: widget.controller,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        keyboardType: widget.inputType,
        textAlign: TextAlign.start,

        obscureText: widget.isPassword ? _obscureText : false,
        onChanged: widget.onChanged,
        validator: widget.validator, // ✅ validation use
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: Icon(widget.icon, color: AppColors.primaryColor),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[700],
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}

class CustomIntlMobileField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final String initialCountryCode;
  final List<String> favoriteCountries;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

  const CustomIntlMobileField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.initialCountryCode = "IN",
    this.favoriteCountries = const ["IN", "US"],
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialCountryCode: initialCountryCode,
      disableLengthCheck: true,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon, color: AppColors.primaryColor), // ✅ custom icon
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
      ),
      onChanged: (phone) {
        // log("Complete Number: ${phone.completeNumber}");
        if (onChanged != null) {
          onChanged!(phone.completeNumber);
        }
      },
      validator: (phone) {
        if (phone == null || phone.number.isEmpty) {
          return "Enter your mobile number";
        }
        if (phone.number.length != 10) {
          return "Enter validate 10 digit mobile number";
        }
        if (validator != null) return validator!(phone.completeNumber);
        return null;
      },
    );
  }
}
