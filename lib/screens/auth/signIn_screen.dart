import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_images.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/auth/signUp_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custom_loader.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/custometextfield.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
// <<<<<<< HEAD
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool keepSignedIn = false;

  final _formKey = GlobalKey<FormState>();

  String? validateSignInFields() {
    if (emailController.text.trim().isEmpty) {
      return "Please enter your email";
    }
    if (passwordController.text.trim().isEmpty) {
      return "Please enter your password";
    }
    return null; // ✅ No error
  }

  void onSignIn() {
    String? errorMessage = validateSignInFields();
    if (errorMessage != null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
      return;
    }

    // All good → Sign In process here
    print("Sign In successful!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),

                // Logo
                Image.asset("assets/images/logo1.png", width: 80, height: 80),

                const SizedBox(height: 20),

                // App name
                Text("nightingale", style: blackText20400),

                const SizedBox(height: 10),

                // Subtitle
                Text(
                  "Sign In to access smart medical & e-pharma.",
                  style: greyText13400,
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 40),

                // Email field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Email Address", style: blackText16400),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  icon: Icons.email_outlined,
                  controller: emailController,
                  hintText: "Enter your email address...",
                  inputType: TextInputType.emailAddress,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      showErrorToast(context, "Email is required");
                      return "";
                    }
                  },
                ),

                const SizedBox(height: 20),

                // Password field
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password", style: blackText16400),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  hintText: "Enter your password",
                  inputType: TextInputType.number,
                  isPassword: true,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      showErrorToast(context, "Password is required");
                      return "";
                    }
                  },
                ),

                const SizedBox(height: 15),

                // Keep me signed in + Forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: keepSignedIn,
                          activeColor: const Color(0xFF14B8A6),
                          shape: const CircleBorder(),
                          onChanged: (value) {
                            setState(() {
                              keepSignedIn = value ?? false;
                            });
                          },
                        ),
                        const Text("Keep me signed in"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(color: Color(0xFF14B8A6)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Sign In Button
                customElevatedButton(
                  backgroundColor: AppColors.primaryColor,
                  title: "Sign In",
                  righticon: Icons.login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      onSignIn();
                    }
                    // Handle sign in logic
                  },
                ),

                const SizedBox(height: 10),

                // Divider OR
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[400])),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider(color: Colors.grey[400])),
                  ],
                ),

                const SizedBox(height: 10),

                // Google Sign In Button
                customElevatedButton(
                  imagepath: AppImages.google_icon,
                  backgroundColor: AppColors.black87,
                  title: "Sign In With Google",
                  onPressed: () {
                    // Handle sign in logic
                  },
                ),
                const SizedBox(height: 30),

                // Sign Up link
                GestureDetector(
                  onTap: () {
                    replaceScreen(context, SignUpScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Don't have an account? "),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFF14B8A6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );  
  }
}

