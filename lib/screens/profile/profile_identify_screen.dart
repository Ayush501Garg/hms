import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/CustomDatePickerField.dart';
import 'package:hms/widgets/custome_button.dart';
import 'package:hms/widgets/custome_dropdown.dart';
import 'package:hms/widgets/custome_slider.dart';
import 'package:hms/widgets/custometextfield.dart';
import 'package:hms/widgets/multiple_select_chip.dart';

class Profile_Identify_screen extends StatefulWidget {
  const Profile_Identify_screen({Key? key}) : super(key: key);

  @override
  State<Profile_Identify_screen> createState() =>
      _Profile_Identify_screenState();
}

class _Profile_Identify_screenState extends State<Profile_Identify_screen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;
  String? selectedState;
  String? selectedCountry;
  String? selecthomeadd;
  String? selectapartment;
  DateTime? selectedDate;

  final nameController = TextEditingController();
  final addresController = TextEditingController();
  final zipController = TextEditingController();
  final idController = TextEditingController();
  final anythingController = TextEditingController();
  final stateController = TextEditingController();
  final phoneController = TextEditingController();
  final noteController = TextEditingController();

  final genders = ["Male", "Female", "Other"];
  final states = [
    "Aberdeen City",
    "Aberdeenshire",
    "Anglesey",
    "Antrim",
    "Armagh",
    "Belfast",
  ];

  final country = [
    "India",
    "United States",
    "Malaysia",
    "United Kingdom",
    "Canada",
    "Australia",
    "Germany",
  ];

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final List<String> allergies = ["Pollen", "Food", "Pet", "Insectal", "TP"];
  final List<String> selectedAllergies = [];

  double height = 160;
  double weight = 60;

  String? selectedFileName;

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
                await _pickFile(FileType.custom, ['pdf']);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image, color: Colors.blue),
              title: const Text("Upload Image"),
              onTap: () async {
                Navigator.pop(context);
                await _pickFile(FileType.image, null);
              },
            ),
          ],
        );
      },
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(20),

              // Profile Icon
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.teal.withOpacity(0.2),
                  child: const Icon(Icons.person, size: 50, color: Colors.teal),
                ),
              ),

              verticalSpace(20),

              const Text(
                "Please confirm and fill your identity below",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              verticalSpace(20),

              Text("Created", style: blackText20400),
              verticalSpace(10),
              CustomTextField(
                icon: Icons.person_outline,
                hintText: 'Enter Name',
                inputType: TextInputType.text,
                controller: nameController, 
                
              ),

              verticalSpace(20),

              CustomDropdownField(
                value: selectedGender,
                hint: "Gender",
                icon: Icons.male,
                items: genders,
                onChanged: (value) {
                  setState(() {
                    selectedGender = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Select your gender" : null,
              ),

              verticalSpace(20),

              CustomDatePickerField(
                selectedDate: selectedDate,
                hint: "Date of ",
                icon: Icons.calendar_today,
                onTap: () => _pickDate(context),
                validator: (value) =>
                    value!.isEmpty ? "Select your date of birth" : null,
              ),

              verticalSpace(20),

              CustomDropdownField(
                value: selectedState,
                hint: "State",
                icon: Icons.map,
                items: states, // yaha directly states list use ho rahi hai
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                  });
                },
                validator: (value) => value == null ? "Select a state" : null,
              ),

              verticalSpace(20),

              CustomTextField(
                icon: Icons.credit_card,
                hintText: 'Enter Id Card Number',
                inputType: TextInputType.text,
                controller: idController,
              ),

              verticalSpace(20),

              CustomIntlMobileField(
                controller: phoneController,
                hintText: "Mobile Number",
                icon: Icons.phone,
                initialCountryCode: "IN",
                favoriteCountries: ["IN", "US", "MY"],
                onChanged: (number) {
                  print("📱 User entered: $number");
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a valid mobile number";
                  }
                  return null;
                },
              ),

              verticalSpace(20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on, color: Colors.black54),
                  Text("Address", style: blackText20400),
                ],
              ),

              verticalSpace(10),
              Text("Nationality", style: blackText18400),
              CustomDropdownField(
                value: selectedCountry,
                hint: "Country",
                icon: Icons.map,
                items: country, // yaha directly states list use ho rahi hai
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
                validator: (value) => value == null ? "Select a country" : null,
              ),

              verticalSpace(10),
              Text("hometown", style: blackText18400),
              CustomDropdownField(
                value: selecthomeadd,
                hint: "homeaddress",
                icon: Icons.map,
                items: country, // yaha directly states list use ho rahi hai
                onChanged: (value) {
                  setState(() {
                    selecthomeadd = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Select a hometown" : null,
              ),

              verticalSpace(10),
              Text("apartment", style: blackText18400),
              CustomDropdownField(
                value: selectapartment,
                hint: "apartment",
                icon: Icons.map,
                items: country, // yaha directly states list use ho rahi hai
                onChanged: (value) {
                  setState(() {
                    selectapartment = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Select a hometown" : null,
              ),

              verticalSpace(20),

              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "address",
                          style: blackText18400,
                          textAlign: TextAlign.start,
                        ),
                        verticalSpace(10),
                        CustomTextField(
                          // margin: EdgeInsets.symmetric(horizontal: 80),
                          // icon: Icons.person_outline,
                          hintText: 'address',
                          inputType: TextInputType.text,
                          controller: addresController,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "zipCode",
                          style: blackText18400,
                          textAlign: TextAlign.start,
                        ),
                        verticalSpace(10),
                        CustomTextField(
                          // margin: EdgeInsets.symmetric(horizontal: 110),
                          // icon: Icons.person_outline,
                          hintText: 'zipCode',
                          inputType: TextInputType.text,
                          controller: zipController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              verticalSpace(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Allergies",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  MultiSelectChipsExample(),
                ],
              ),

              verticalSpace(20),

              CustomTextField(
                icon: Icons.person,
                hintText: 'anything',
                inputType: TextInputType.text,
                controller: anythingController,
              ),

              verticalSpace(20),

              CustomTextField(
                icon: Icons.person,
                hintText: 'anything',
                inputType: TextInputType.text,
                controller: anythingController,
              ),

              verticalSpace(20),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Height Slider
                    CustomSliderField(
                      label: "Height",
                      min: 100,
                      max: 220,
                      unit: "cm",
                      initialValue: height,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                    ),

                    verticalSpace(20),

                    // Weight Slider
                    CustomSliderField(
                      label: "Weight",
                      min: 30,
                      max: 150,
                      unit: "kg",
                      initialValue: weight,
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                      },
                    ),

                    const SizedBox(height: 30),

                    // Print values
                    Text("Selected Height: ${height.round()} cm"),
                    Text("Selected Weight: ${weight.round()} kg"),
                  ],
                ),
              ),

              verticalSpace(20),

              CustomTextField(
                hintText: "Enter your additional notes...",
                controller: noteController,
                minLines: 3,
                maxLines: 8,
                inputType: TextInputType.text, // jitna user likhe utna expand
              ),

              verticalSpace(20),

              Text("Insaurance ", style: blackText20400),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "onetext",
                    style: blackText18400,
                    textAlign: TextAlign.start,
                  ),
                  CustomTextField(
                    icon: Icons.person,
                    hintText: 'anything',
                    inputType: TextInputType.text,
                    controller: anythingController,
                  ),
                ],
              ),

              verticalSpace(20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "secondText",
                    style: blackText18400,
                    textAlign: TextAlign.start,
                  ),
                  CustomTextField(
                    icon: Icons.person,
                    hintText: 'anything',
                    inputType: TextInputType.text,
                    controller: anythingController,
                  ),
                ],
              ),

              verticalSpace(10),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "thirdText",
                    style: blackText18400,
                    textAlign: TextAlign.start,
                  ),
                  CustomTextField(
                    icon: Icons.person,
                    hintText: 'anything',
                    inputType: TextInputType.text,
                    controller: anythingController,
                  ),
                ],
              ),

              verticalSpace(20),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Insurance Card",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade800,
                  ),
                ),
              ),

              verticalSpace(10),

              Container(
                // padding: const EdgeInsets.all(16),
                // margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title

                    // Upload Section
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.grey.shade300,),
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      child: Column(
                        children: [
                          Text(
                            selectedFileName ?? "Browse your File to upload",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: selectedFileName != null
                                  ? Colors.black
                                  : AppColors.primaryColor,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            "Supports format: SVG, JPG, PNG, PDF (Max 5MB)",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 16),

                          // Browse Button
                          ElevatedButton.icon(
                            onPressed: _showFileOptions,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                            ),
                            icon: const Icon(
                              Icons.upload_file,
                              color: Colors.white,
                            ),
                            label: const Text(
                              "Browse File",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              verticalSpace(20),

              customElevatedButton(
                title: "Submit",
                icon: Icons.check,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Form Submitted ✅")),
                    );
                  }
                },
              ),
              verticalSpace(10),
              Center(child: Icon(Icons.lock, color: Colors.black)),

              verticalSpace(10),
              Text(
                "Your personal & medical data is safe and secure.\nWe never share it with anyone 👍",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StateSelectionBottomSheet {
  static Future<String?> show(BuildContext context) async {
    String? selectedState;

    final states = [
      "Aberdeen City",
      "Aberdeenshire",
      "Anglesey",
      "Antrim",
      "Armagh",
      "Belfast",
      "Cardiff",
      "Dublin",
      "Edinburgh",
    ];

    return await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Select State/Province",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Scrollable list
                  SizedBox(
                    height: 5 * 50,
                    child: ListView.builder(
                      itemCount: states.length,
                      itemBuilder: (context, index) {
                        final state = states[index];
                        final isSelected = state == selectedState;
                        return GestureDetector(
                          onTap: () {
                            setModalState(() {
                              selectedState = state;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.teal.withOpacity(0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.teal
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Text(
                              state,
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected
                                    ? Colors.teal
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Apply button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      icon: const Icon(Icons.check, color: Colors.white),
                      label: const Text(
                        "Apply",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: selectedState == null
                          ? null
                          : () {
                              Navigator.pop(context, selectedState);
                            },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
