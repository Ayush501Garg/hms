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
  dynamic backgroundColor = AppColors.primaryColor, //= const Color(0xFF14B8A6),
  double borderRadius = 10,
  double paddingVertical = 14,
  double paddingHorizontal = 24,
  IconData? righticon,
  final String? imagepath, // optional
}) // optional
{
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
        if (icon != null) ...[
          Icon(icon, size: 20, color: Colors.white),
          SizedBox(width: 8),
        ],
        if (icon != null) ...[
          SizedBox(width: 8),

          Text(title, style: whiteText16600),
        ],

        if (imagepath != null) ...[
          Image.asset(imagepath, height: 20, width: 20),
          SizedBox(width: 8),
        ],
        if (righticon != null) ...[Text(title, style: whiteText16600)],
        if (righticon != null) ...[
          SizedBox(width: 8),
          Icon(righticon, size: 20, color: Colors.white),
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
