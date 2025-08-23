import 'dart:math' as MainAxisSize;

import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';

Widget customElevatedButton({
  String? title,
  Widget? child, // optional
  IconData? icon, // optional
  VoidCallback? onPressed,
  titleStyle,
  iconColor,
  Color? borderColor, // ✅ updated to Color? type
  Color backgroundColor = AppColors.primaryColor,
  double borderRadius = 10,
  double paddingVertical = 14,
  double paddingHorizontal = 24,
  IconData? righticon,
  final String? imagepath, // optional
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderColor != null
            ? BorderSide(color: borderColor, width: 1.5)
            : BorderSide.none, // ✅ add border if color provided
      ),
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical,
        horizontal: paddingHorizontal,
      ),
      elevation: 2,
    ),
    child: child ??
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color:iconColor?? Colors.white),
              SizedBox(width: 8),
            ],
            if (icon != null )
              Text(title ?? "", style:titleStyle?? whiteText16600),
            if (imagepath != null) ...[
              Image.asset(imagepath, height: 20, width: 20),
              SizedBox(width: 8),
            ],
            if (righticon != null) ...[
              Text(title ?? "", style:titleStyle?? whiteText16600),
              SizedBox(width: 8),
              Icon(righticon, size: 20, color:iconColor?? Colors.white),
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
      backgroundColor: const Color(0xFF1E293B),
      foregroundColor: Colors.white,
      elevation: 4,
    ),
    child: Icon(icon),
  );
}
