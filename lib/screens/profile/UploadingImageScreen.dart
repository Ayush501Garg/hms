import 'package:flutter/material.dart';

class UploadingImageScreen extends StatelessWidget {
  final String imagePath; // dynamic image path
  final double progress;  // upload progress (0.0 to 1.0)
  final String fileName;  // file name

  const UploadingImageScreen({
    super.key,
    required this.imagePath,
    required this.progress,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular Image with Progress Indicator Border
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 140,
                    width: 140,
                    child: CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 6,
                      backgroundColor: Colors.grey.shade300,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.teal,
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Image.asset(
                      imagePath,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Uploading text
              const Text(
                "Uploading Image...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // File name
              Text(
                fileName,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
