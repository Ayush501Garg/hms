import 'package:flutter/material.dart';

  /// Push a new screen
   void pushScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Replace current screen with a new one
   void replaceScreen(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Push a screen and remove all previous routes
   void pushScreenAndRemoveUntil(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
          (route) => false,
    );
  }

  /// Pop current screen
   void popScreen(BuildContext context, [Object? result]) {
    Navigator.pop(context, result);
  }
