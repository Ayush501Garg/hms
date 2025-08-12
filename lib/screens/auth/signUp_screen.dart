import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/auth/signIn_screen.dart';
import 'package:hms/screens/home_screen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custom_loader.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/custometextfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String passwordStrength = "Weak";
  double strengthValue = 0.0;

  void checkPasswordStrength(String password) {
    // Step 1: Check length first
    if (password.length < 6 || password.length > 12) {
      setState(() {
        strengthValue = 0.3;
        passwordStrength = "Weak";
      });
      return;
    }

    // Step 2: Pattern checks
    bool hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
    bool hasNumber = RegExp(r'[0-9]').hasMatch(password);
    bool hasSymbol = RegExp(r'[!@#\$&*~]').hasMatch(password);

    // Step 3: Decide strength
    if (hasLetter && !hasNumber && !hasSymbol) {
      // Only letters → Weak
      setState(() {
        strengthValue = 0.3;
        passwordStrength = "Weak";
      });
    } else if (hasLetter && (hasNumber ^ hasSymbol)) {
      // Letters + (Numbers OR Symbols) → Medium
      setState(() {
        strengthValue = 0.6;
        passwordStrength = "Medium";
      });
    } else if (hasLetter && hasNumber && hasSymbol) {
      // Letters + Numbers + Symbols → Strong
      setState(() {
        strengthValue = 1.0;
        passwordStrength = "Strong";
      });
    } else {
      // Anything else → Weak
      setState(() {
        strengthValue = 0.3;
        passwordStrength = "Weak";
      });
    }
  }

  Widget passwordStrengthBar(double strengthValue) {
    // strengthValue: 0.0 to 1.0
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: strengthValue >= 0.33 ? Colors.red : Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: strengthValue >= 0.66 ? Colors.orange : Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 6,
            margin: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
              color: strengthValue == 1.0 ? Colors.green : Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }

  String? validateFields() {
    if (emailController.text.trim().isEmpty) {
      return "Please enter your email";
    }
    if (passwordController.text.trim().isEmpty) {
      return "Please enter your password";
    }
    if (confirmPasswordController.text.trim().isEmpty) {
      return "Please confirm your password";
    }
    if (confirmPasswordController.text.trim() !=
        passwordController.text.trim()) {
      return "Passwords do not match";
    }
    return null; // ✅ No error
  }

  void onSubmit() {
    String? errorMessage = validateFields();
    if (errorMessage != null) {
      replaceScreen(context, MainPage());
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
      return;
    }

    // All good → Continue
    print("Form submitted successfully!");
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),

                // Logo
                Center(
                  child: Image.asset(
                    "assets/images/logo1.png",
                    width: 80,
                    height: 80,
                  ),
                ),

                const SizedBox(height: 20),

                // App name
                Center(child: Text("nightingale", style: blackText20400)),

                const SizedBox(height: 10),

                // Subtitle
                Center(
                  child: Text(
                    "Sign Up to access smart medical & e-pharma.",
                    style: greyText13400,
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 40),

                // Email
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

                // Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 8),

                CustomTextField(
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  hintText: "Enter your password",
                  inputType: TextInputType.text,
                  isPassword: true,
                  onChanged: (value) {
                    checkPasswordStrength(value); // ✅ real-time update
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      showErrorToast(context, "Password is required");
                      return "";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                passwordStrengthBar(strengthValue),

                const SizedBox(height: 5),

                Text(
                  passwordStrength.isEmpty
                      ? ""
                      : "Password strength: $passwordStrength",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: passwordStrength == "Weak"
                        ? Colors.red
                        : passwordStrength == "Medium"
                        ? Colors.orange
                        : Colors.green,
                  ),
                ),

                const SizedBox(height: 20),

                // Confirm Password
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Confirm Password", style: blackText16400),
                ),
                const SizedBox(height: 8),
                CustomTextField(
                  icon: Icons.lock_outline,
                  controller: confirmPasswordController,
                  hintText: "Re-enter your password",
                  inputType: TextInputType.text,
                  isPassword: true,
                  onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value != passwordController.text) {
                      showErrorToast(context, "Passwords do not match or password is empty");
                      return "";
                    }
                  },
                ),

                const SizedBox(height: 30),

                // Sign Up Button
                customElevatedButton(
                  backgroundColor: AppColors.primaryColor,
                  title: "Sign Up",
                  righticon: Icons.login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      onSubmit();
                    }
                    // Handle sign up
                  },
                ),

                const SizedBox(height: 20),

                // Already have account
                GestureDetector(
                  onTap: () {
                    replaceScreen(context, SigninScreen());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("I already have "),
                      Text(
                        "an account",
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
