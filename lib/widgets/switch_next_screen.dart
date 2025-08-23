import 'package:flutter/material.dart';

void customNavigate(BuildContext context, Widget nextScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextScreen),
  );
}