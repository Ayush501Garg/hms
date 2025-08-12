import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
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

void showErrorToast(BuildContext context, String message) {
  toastification.show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    title: Text(message),
    autoCloseDuration: const Duration(seconds: 3),
    alignment: Alignment.topCenter,
    borderRadius: BorderRadius.circular(12),
    showProgressBar: true,
  );
}
