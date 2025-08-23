import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/profile/PhoneOtpSetupScreen.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/custometextfield.dart';
import 'package:hms/widgets/switch_next_screen.dart';

class SecurityQuestionsScreen extends StatefulWidget {
  @override
  State<SecurityQuestionsScreen> createState() =>
      _SecurityQuestionsScreenState();
}

class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
  String? selectedQuestion;

  final _answerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<String> questions = [
    "What was the name of your elementary School?",
    "What is the official legal last name of your mother?",
    "What was the first name of your first pet you owned?",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
        
                children: [

                  verticalSpace(30),
        
                  Icon(Icons.shield, size: 70, color: Colors.amber.shade700),
        
                  verticalSpace(30),

                  Text("Security Questions", style: blackText24400),
                  
                  verticalSpace(20),
        
                  Column(
                    children: questions.map((question) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: selectedQuestion == question
                                ? AppColors.primaryColor
                                : AppColors.lightGrey,
                            width: 2,
                          ),
        
                          color: selectedQuestion == question
                              ? AppColors.primaryColor.withOpacity(0.1)
                              : AppColors.white,
                        ),
                        child: RadioListTile<String>(
                          value: question,
                          groupValue: selectedQuestion,
                          onChanged: (String? value) {
                            setState(() {
                              selectedQuestion = value;
                            });
                          },
        
                          title: Text(
                            question,
                            style: const TextStyle(fontSize: 14),
                          ),
                          activeColor: Colors.teal,
                        ),
                      );
                    }).toList(),
                  ),
                  verticalSpace(20),
                  CustomTextField(
                    icon: Icons.question_mark,
                    hintText: 'Enter your answer',
                    inputType: TextInputType.text,
                    controller: _answerController,
                  ),
                  verticalSpace(20),
        
                  customElevatedButton(
                    title: "Continue",
                    righticon: Icons.arrow_forward_ios,
        
                    onPressed: () {
                      if (selectedQuestion != null ||
                          _answerController.text.isNotEmpty) {
                            customNavigate(context, PhoneOtpSetupScreen(),
                       
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



























// import 'package:flutter/material.dart';

// class SecurityQuestionsScreen extends StatefulWidget {
//   @override
//   _SecurityQuestionsScreenState createState() => _SecurityQuestionsScreenState();
// }

// class _SecurityQuestionsScreenState extends State<SecurityQuestionsScreen> {
//   String? selectedQuestion;
//   final TextEditingController _answerController = TextEditingController();

//   final List<String> questions = [
//     "What was the name of your elementary School?",
//     "What is the official legal last name of your mother?",
//     "What was the first name of your first pet you owned?",
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 40),

//                 // Shield Icon
//                 Icon(Icons.shield, size: 70, color: Colors.amber.shade700),

//                 const SizedBox(height: 20),

//                 // Title
//                 const Text(
//                   "Security Questions",
//                   style: TextStyle(
//                     fontSize: 22,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 30),

//                 // Questions List
//                 Column(
//                   children: questions.map((question) {
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: selectedQuestion == question
//                               ? Colors.teal
//                               : Colors.grey.shade400,
//                           width: 2,
//                         ),
//                         color: selectedQuestion == question
//                             ? Colors.teal.withOpacity(0.1)
//                             : Colors.white,
//                       ),
//                       child: RadioListTile<String>(
//                         value: question,
//                         groupValue: selectedQuestion,
//                         onChanged: (value) {
//                           setState(() {
//                             selectedQuestion = value;
//                           });
//                         },
//                         title: Text(
//                           question,
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                         activeColor: Colors.teal,
//                       ),
//                     );
//                   }).toList(),
//                 ),

//                 const SizedBox(height: 20),

//                 // Answer TextField
//                 TextField(
//                   controller: _answerController,
//                   decoration: InputDecoration(
//                     hintText: "Enter your answer",
//                     prefixIcon: const Icon(Icons.question_mark),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // Submit Button
//                 ElevatedButton(
//                   onPressed: () {
//                     if (selectedQuestion != null &&
//                         _answerController.text.isNotEmpty) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text(
//                               "Selected: $selectedQuestion\nAnswer: ${_answerController.text}"),
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.teal,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 40, vertical: 12),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child: const Text(
//                     "Submit",
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }






