import 'package:flutter/material.dart';
import 'package:hms/screens/auth/forgot_password_option_screen.dart';
import 'package:hms/screens/auth/signIn_screen.dart';
import 'package:hms/core/app_colors.dart';
import 'package:hms/utils/navigation_utils.dart';
import 'package:hms/widgets/custome_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/boarding1.png",
      "title": "Personalized Health That You Can Control",
      "subtitle": "Take charge of your wellness journey effortlessly.",
    },
    {
      "image": "assets/images/boarding2.png",
      "title": "A Health Metrics That Understands You.",
      "subtitle":
          "Insights designed around your unique and professional needs..",
    },
    {
      "image": "assets/images/boarding3.png",
      "title": "E-Pharmacies With Lowest Price",
      "subtitle":
          "Compare prices instantly and save on your medications, with no downside.",
    },
    {
      "image": "assets/images/boarding4.png",
      "title": "AI Health & Medical Assistant",
      "subtitle":
          "AI-driven support for smarter health decisions, powered by most capable health LLMs",
    },
    {
      "image": "assets/images/boarding5.png",
      "title": "Electronic Health Record, Simplified",
      "subtitle":
          "Browse and explore your health history from medical professionals",
    },
    {
      "image": "assets/images/boarding6.png",
      "title": "Access to 24/7 Virtual Care Is Here",
      "subtitle": "Expert support whenever and wherever you need it, anytime.",
    },
    {
      "image": "assets/images/boarding7.png",
      "title": "E-Prescription Made Intuitively Easy",
      "subtitle":
          "Seamless digital prescriptions and management at your fingertips..",
    },
    {
      "image": "assets/images/boarding8.png",
      "title": "Smart Medication Management",
      "subtitle":
          "Insights designed around your unique and professional needs.",
    },
    {
      "image": "assets/images/boarding9.png",
      "title": "Most Accurate AI Symptom Checker",
      "subtitle":
          "Never miss a dose of your medication with intuitive tracking tools.",
    },
    {
      "image": "assets/images/boarding10.png",
      "title": "Check How Drugs Interact",
      "subtitle":
          "Instantly detect potential drug interactions and monitor the details closely.",
    },
    {
      "image": "assets/images/boarding11.png",
      "title": "Explore Health & Wellness Resources",
      "subtitle":
          "Trusted medical and healthcare content to guide your well-being.",
    },
  ];

  void goToPage(int page) {
    if (page >= 0 && page < onboardingData.length) {
      _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  void skip() {
    goToPage(onboardingData.length - 1);
  }

  void finishOnboarding() {
    nextscreen(context, ForgotPasswordOptionScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() => currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];
                    return buildOnboardingContent(
                      // topContent: nightingaleScoreCard(),
                      imagepath: item['image']!,
                      title: item['title']!,
                      subtitle: item['subtitle']!,
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  circleArrowButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: () => goToPage(currentPage - 1),
                  ),
                  const SizedBox(width: 20),
                  circleArrowButton(
                    icon: Icons.arrow_forward_ios,
                    onPressed: () => goToPage(currentPage + 1),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),

          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value:
                      (currentPage + 1) /
                      onboardingData.length, // Progress fraction
                  backgroundColor: Colors.grey[300], // Unfilled color
                  valueColor: AlwaysStoppedAnimation(
                    AppColors.primaryColor,
                  ), // Filled color
                  minHeight: 6, // Thickness of the bar
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: GestureDetector(
              onTap: () {
                if (currentPage == onboardingData.length - 1) {
                  finishOnboarding();
                } else {
                  skip();
                }
              },
              child: Text(
                currentPage == onboardingData.length - 1 ? 'Continue' : 'Skip',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingContent({
    // required Widget topContent,
    required String imagepath,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            height: 500,
            color: AppColors.lightprimaryColor,
            child: Image.asset(imagepath, height: 300, width: 350),
          ),
          Spacer(flex: 2),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget nightingaleScoreCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Row with icon, score, and dropdown
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.auto_graph, color: Color(0xFF14B8A6), size: 24),
                  SizedBox(width: 8),
                  Text(
                    "82.5",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.expand_more, size: 18),
                label: const Text("Weekly"),
              ),
            ],
          ),

          const SizedBox(height: 4),
          const Text(
            "Your nightingale Score",
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),

          const SizedBox(height: 16),

          /// Dummy Graph Box (placeholder)
          Container(
            height: 100,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFDCF5F3), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Text("📊 Graph Placeholder")),
          ),

          const SizedBox(height: 16),

          /// Bottom Row with stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Row(
                children: [
                  Icon(Icons.trending_down, color: Colors.red, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "-12%",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text("vs last week", style: TextStyle(color: Colors.black54)),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Text("8 insights", style: TextStyle(color: Colors.black54)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
