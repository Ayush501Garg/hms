import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:toastification/toastification.dart';


void showToast(BuildContext context, String msg, 
    {bool isError = false}) {
  // Determine colors & icon
  final bgColor = isError 
      ? Colors.red.shade100 
      : AppColors.lightGreen;
  final borderColor = isError 
      ? Colors.red 
      : AppColors.primaryGreen;
  final icon = isError ? Icons.error : Icons.check_circle;

  toastification.showCustom(
    context: context,
    autoCloseDuration: const Duration(seconds: 3),
    alignment: Alignment.topCenter,
    // style: ToastificationStyle.minimal, // ensures no default visuals clash

    builder: (context, holder) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor, width: 2), // custom border
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: borderColor, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                msg,
                style: blackText18400.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
















// void showToast(BuildContext context, String msg) {
//   toastification.show(
//     context: context,
//     style: ToastificationStyle.fillColored, // 👈 better style
//     alignment: Alignment.topCenter,
//     autoCloseDuration: const Duration(seconds: 3),
//     borderRadius: BorderRadius.circular(16), // smooth corners
//     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // spacing
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),

//     primaryColor: AppColors.primaryColor, // icon & accent
//     backgroundColor: AppColors.lightprimaryColor, // bg color

//     boxShadow: [
//       BoxShadow(
//         color: Colors.black.withOpacity(0.1), // soft shadow
//         blurRadius: 8,
//         offset: const Offset(0, 4),
//       ),
//     ],

//     title: Text(
//       msg,
//       style: blackText18400.copyWith(
//         fontSize: 15,
//         fontWeight: FontWeight.w500,
//       ),
//     ),
//   );
// }
