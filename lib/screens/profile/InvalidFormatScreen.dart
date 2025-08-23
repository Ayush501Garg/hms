import 'package:flutter/material.dart';

class InvalidFormatScreen extends StatelessWidget {
  final VoidCallback onReupload;        // Re-upload button action
  final List<String> allowedExtensions; // e.g. ['jpg','png']
  final String? fileName;               // optional: show which file was wrong

  const InvalidFormatScreen({
    super.key,
    required this.onReupload,
    this.allowedExtensions = const ['jpg', 'png'],
    this.fileName,
  });

  @override
  Widget build(BuildContext context) {
    final formats = allowedExtensions.map((e) => '.$e').join(' or ');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ⚠️ Icon inside soft red circle
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFFE6E6), // light red
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.warning_amber_rounded,
                      size: 44,
                      color: Color(0xFFE53935), // red
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Title
                const Text(
                  "Invalid Format!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 8),

                // Subtitle
                Text(
                  fileName == null
                      ? "Please ensure format is $formats"
                      : "$fileName is not supported.\nPlease ensure format is $formats",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 28),

                // Re-upload button (teal, rounded, with upload icon)
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: onReupload,
                    icon: const Icon(Icons.upload_file, color: Colors.white),
                    label: const Text(
                      "Re-upload image",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1ABC9C), // teal vibe
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
