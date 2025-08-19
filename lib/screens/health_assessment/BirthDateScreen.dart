import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/core/app_text_styles.dart';
import 'package:hms/screens/health_assessment/GenderSelectionScreen.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/utils/size_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class BirthDateScreen extends StatefulWidget {
  const BirthDateScreen({super.key});

  @override
  State<BirthDateScreen> createState() => _BirthDateScreenState();
}

class _BirthDateScreenState extends State<BirthDateScreen> {
  int selectedMonth = 8; // September
  int selectedDay = 6;
  int selectedYear = 2001;

  final List<String> months = const [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  List<int> years = [];

  @override
  void initState() {
    super.initState();
    int currentYear = DateTime.now().year;
    years = List.generate(
      100,
      (index) => currentYear - index,
    ); // last 100 years
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Top bar with back, progress, skip
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: Colors.grey.shade200,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.primaryColor,
                      ),
                      minHeight: 7,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Skip", style: primaryText16600),
                ),
              ],
            ),

            const Spacer(),

            Text(
              "When were you born?",
              textAlign: TextAlign.center,
              style: blackText24600,
            ),

            verticalSpace(50),

            // Stack with one highlight box across all pickers
            SizedBox(
              height: 250,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Highlight selection box
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor.withOpacity(0.05),
                    ),
                  ),

                  // Pickers
                  Row(
                    children: [
                      // Month Picker
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          perspective: 0.002,
                          diameterRatio: 2.0,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setState(() => selectedMonth = index);
                          },
                          controller: FixedExtentScrollController(
                            initialItem: selectedMonth,
                          ),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: months.length,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  months[index],
                                  style: selectedMonth == index
                                      ? primaryText20600
                                      : greyText18400,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Day Picker
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setState(() => selectedDay = index + 1);
                          },
                          controller: FixedExtentScrollController(
                            initialItem: selectedDay - 1,
                          ),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: 31,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  "${index + 1}".padLeft(2, '0'),
                                  style: selectedDay == index + 1
                                      ? primaryText20600
                                      : greyText18400,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      // Year Picker
                      Expanded(
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 40,
                          physics: const FixedExtentScrollPhysics(),
                          onSelectedItemChanged: (index) {
                            setState(() => selectedYear = years[index]);
                          },
                          controller: FixedExtentScrollController(
                            initialItem: years.indexOf(selectedYear),
                          ),
                          childDelegate: ListWheelChildBuilderDelegate(
                            childCount: years.length,
                            builder: (context, index) {
                              return Center(
                                child: Text(
                                  "${years[index]}",
                                  style: selectedYear == years[index]
                                      ? primaryText20600
                                      : greyText18400,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            verticalSpace(30),

            // Age info
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cake_outlined, size: 18, color: AppColors.greyColor),
                const SizedBox(width: 6),
                Text(
                  "I’m ${DateTime.now().year - selectedYear} years of age",
                  style: greyText14400,
                ),
              ],
            ),

            const Spacer(),

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: customElevatedButton(
                title: "Continue",
                righticon: Icons.arrow_forward,
                onPressed: () {
                  pushScreen(context, GenderSelectionUI());
                },
              ),
            ),

            verticalSpace(50),
          ],
        ),
      ),
    );
  }
}
