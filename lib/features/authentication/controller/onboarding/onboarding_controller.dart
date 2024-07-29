import 'package:alif_e_commerce/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// variable
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update current index when scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to the spesific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  ///update current index and jump to the next page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage = GetStorage();
      storage.write("IsFirstTime", false);

      //goto login
      Get.offAll(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///update current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
