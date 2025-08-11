import 'package:flutter/material.dart';

/// Screen width
double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

/// Screen height
double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

/// Vertical spacing (SizedBox)
SizedBox verticalSpace(height) {
  return SizedBox(height: height * 1.0);
}

/// Horizontal spacing (SizedBox)
 SizedBox horizontalSpace(width) {
  return SizedBox(width: width*1.0);
}


