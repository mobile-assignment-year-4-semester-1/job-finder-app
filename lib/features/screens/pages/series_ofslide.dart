import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder_app/features/screens/providers/onboading_provider.dart';
import 'package:job_finder_app/features/utils/constants/app.colors.dart';
import 'package:job_finder_app/features/utils/constants/images.dart';
import 'package:job_finder_app/features/utils/constants/sizes.dart';

class SeriesOfSlide extends StatelessWidget {
  SeriesOfSlide({super.key});

  final OnBoardingProvider controller = Get.put(OnBoardingProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: CallImages.onBoardingImage1,
                title: "Choose your Products",
                description:
                    "Browse through a wide range of products and select the ones that suit your needs effortlessly.",
              ),
              OnBoardingPage(
                image: CallImages.onBoardingImage2,
                title: "Select Payment Method",
                description:
                    "Enjoy a seamless checkout experience by choosing your preferred payment option.",
              ),
              OnBoardingPage(
                image: CallImages.onBoardingImage3,
                title: "Fast Delivery",
                description:
                    "Get your orders delivered quickly and efficiently right to your doorstep.",
              ),
            ],
          ),

          // Skip Button (Top Right)
          Positioned(
            top: 40,
            right: 20,
            child: TextButton(
              onPressed: controller.skipPage,
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 20,
            child: Obx(
              () => Row(
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.all(4),
                    width: controller.currentPageIndex.value == index ? 12 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: controller.currentPageIndex.value == index
                          ? AppColors.text1
                          : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Next Button (Bottom Right)
          Positioned(
            bottom: 40,
            right: 20,
            child: GestureDetector(
              onTap: controller.nextPage,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.backgroundItem,
                ),
                child: const Icon(Icons.arrow_forward,
                    color: Colors.white, size: 24),
              ),
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
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 200),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.text1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}