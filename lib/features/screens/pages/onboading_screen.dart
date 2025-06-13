import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/series_ofslide.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
                Image.asset('assets/images/Onboarding.png', fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  'Enjoy Your Online Shopping.',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text1),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Browse through all categories and shop the best furniture for your dream house.',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.backgroundItem,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SeriesOfSlide()),
                    );
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(fontSize: 16, color: AppColors.newText),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}