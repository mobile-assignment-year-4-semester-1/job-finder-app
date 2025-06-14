import 'package:flutter/material.dart';
import 'package:job_finder_app/features/screens/pages/series_ofslide.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/constants/images.dart';
import 'package:job_finder_app/features/utils/themes/light_mode.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CallColors.defaultColor,
      body: Column(
        children: [
          Expanded(
            child:
                Image.asset(CallImages.onBoardingImage1, height: 50)
                // Image.asset(CallImages.onBoardingImage1, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(33.0),
            child: Column(
              children: [
                const Text(
                  'Make your dream career with job Finder',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.text1),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  child: Text(
                  'We help find your dream job according to your skillset, location & preference to build your career.',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:CallColors.buttonGreen,
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
                    'Explore',
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