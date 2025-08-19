import 'package:flutter/material.dart';
import 'package:hms/core/app_text_styles.dart';

class Profile_Identify_screen extends StatelessWidget {
  const Profile_Identify_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children : [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Please confirm and fill your identity below',
                style: blackText22400, // Assuming this is defined in app_text_styles.dart
              ),
            ),
          ),
        ]
      ),
    );
  }
}

