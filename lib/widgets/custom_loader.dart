import 'package:flutter/material.dart';
import '../core/app_colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
      strokeWidth: 6.0,
    );
  }
}
