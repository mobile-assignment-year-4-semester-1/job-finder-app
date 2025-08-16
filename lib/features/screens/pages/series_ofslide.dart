import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder_app/features/screens/providers/onboading_provider.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/constants/images.dart';

class SeriesOfSlide extends StatelessWidget {
  SeriesOfSlide({super.key});

  final OnBoardingProvider controller = Get.put(OnBoardingProvider());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: CallImages.job1,
                title: "Search your job",
                description:
                    "Figure out your top five priorities whether it is company culture, salary.",
              ),
              OnBoardingPage(
                image: CallImages.onBoardingImage1,
                title: "Browse the perfect job",
                description:
                    "Our job list includes several industries, so you can find the best job for you.",
              ),
              OnBoardingPage(
                image: CallImages.job2,
                title: "Apply to best jobs",
                description:
                    "You can apply to your desirable jobs very quickly and easily with ease.",
              ),
            ],
          ),

          // Dot Indicators
          Positioned(
            bottom: 110,
            left: 0,
            right: 0,
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentPageIndex.value == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color:
                          controller.currentPageIndex.value == index
                              ? theme.colorScheme.primary
                              : theme.disabledColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Bottom Navigation
          Positioned(
            bottom: 60,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: controller.skipPage,
                  child: Text(
                    'Skip',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.disabledColor,
                      fontSize: 16,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.secondary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Next',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onSecondary,
                    ),
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

// Onboarding Page Widget
class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular Image with Background
          Container(
            padding: const EdgeInsets.all(50),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme.colorScheme.secondaryContainer, // adapts to theme
            ),
            child: Image.asset(image, height: 200),
          ),
          const SizedBox(height: 40),

          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              color: theme.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
