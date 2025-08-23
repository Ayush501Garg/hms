import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hms/screens/profile/InvalidFormatScreen.dart';
import 'package:hms/screens/profile/SecurityQuestionsScreen.dart';
import 'package:hms/screens/profile/UploadingImageScreen.dart';
import 'package:hms/screens/profile/choose_avatar_screen.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  String? selectedFileName;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _goFileOptions() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // yaha values set karo
      _selectedImage = File(pickedFile.path);
      selectedFileName = pickedFile.name; // yeh ImagePicker XFile me hota hai

      String extension = pickedFile.path.split('.').last.toLowerCase();

      if (extension == "jp" || extension == "jpe" || extension == "pn") {
        // ✅ Valid file → UploadingScreen pe bhejo
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadingImageScreen(
              imagePath: _selectedImage!.path, // ab non-null String pass hoga
              progress: 0.6, // 60% ko 0.6 likhna chahiye
              fileName: selectedFileName ?? "unknown_file",
            ),
          ),
        );
      } else {
        // ❌ Invalid file → InvalidFormatScreen pe bhejo
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InvalidFormatScreen(
              onReupload: _goFileOptions, // reupload ke liye dubara call
            ),
          ),
        );
      }
    }
  }

  void _showFileOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.picture_as_pdf, color: Colors.red),
              title: const Text("Upload PDF"),
              onTap: () async {
                Navigator.pop(context); // close bottomsheet
                await _pickPDF();
              },
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text("Upload Image"),
              onTap: () async {
                Navigator.pop(context);
                await _pickImage(); // 👈 yaha se direct image picker chalega
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _pickPDF() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFileName = result.files.first.name;
      });

      // PDF upload screen bana sakte ho yaha
      print("PDF Selected: $selectedFileName");
    }
  }

  Future<void> _pickFile(FileType type, List<String>? extensions) async {
    final result = await FilePicker.platform.pickFiles(
      type: type,
      allowedExtensions: extensions,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        selectedFileName = result.files.first.name;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      selectedFileName = pickedFile.name;

      String extension = pickedFile.path.split('.').last.toLowerCase();

      if (extension == "jpg" || extension == "jpeg" || extension == "png") {
        // ✅ Valid image → UploadingScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadingImageScreen(
              imagePath: _selectedImage!.path,
              progress: 0.6,
              fileName: selectedFileName ?? "unknown_file",
            ),
          ),
        );
      } else {
        // ❌ Invalid format → InvalidFormatScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => InvalidFormatScreen(
              onReupload: _pickImage, // reupload ke liye fir se open
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // Title
              const Text(
                "Set Up Your Profile\nAvatar or Image",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 40),

              // Avatar Circle
              GestureDetector(
                onTap: _pickImage, // tap pe image picker khulega
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: _selectedImage == null
                      ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.teal.withOpacity(0.1),
                          ),
                          child: const Icon(
                            Icons.person_outline,
                            size: 50,
                            color: Colors.teal,
                          ),
                        )
                      : ClipOval(
                          child: Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                ),
              ),

              const SizedBox(height: 40),

              // Upload Image Button
              customElevatedButton(
                title: "Upload Image",
                icon: Icons.upload_file,
                // onPressed: _showFileOptions,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecurityQuestionsScreen()),
                  );
                },
              ),

              const SizedBox(height: 15),

              // Choose Premade Avatar Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseAvatar()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.teal, width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Choose Premade Avatar",
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                  ),
                ),
              ),

              // Skip Button
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.close, color: Colors.red),
                label: const Text(
                  "Skip this step",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
