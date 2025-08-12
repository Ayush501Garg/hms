import 'dart:math' as MainAxisSize;

import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';

Widget customElevatedButton({
  required String title,
  // Color textColor = Colors.white,
  IconData? icon, // optional
  VoidCallback? onPressed,
  Color backgroundColor = const Color(0xFF14B8A6),
  double borderRadius = 10,
  double paddingVertical = 14,
  double paddingHorizontal = 24,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      elevation: 2,
    ),
    child: Row(
      // Use min to fit content
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: whiteText16600),

        if (icon != null) ...[
          horizontalSpace(8),
          Icon(icon, size: 20, color: AppColors.white),
        ],
      ],
    ),
  );
}

Widget circleArrowButton({
  required IconData icon,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(20),
      backgroundColor: const Color(0xFF1E293B), // Almost black like image
      foregroundColor: Colors.white,
      elevation: 4,
    ),
    child: Icon(icon),
  );
}
