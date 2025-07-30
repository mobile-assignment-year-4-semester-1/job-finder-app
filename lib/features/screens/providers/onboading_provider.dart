import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_finder_app/features/screens/pages/default_screen.dart';

class OnBoardingProvider extends GetxController {
  final PageController pageController = PageController();
  var currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void nextPage() {
    if (currentPageIndex.value < 4) {
      pageController.animateToPage(
        currentPageIndex.value + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Get.offAll(() => DefaultScreen());
    }
  }

  void skipPage() {
    Get.offAll(() => DefaultScreen());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}