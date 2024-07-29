import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/text_string.dart';
import '../../controller/onboarding/onboarding_controller.dart';
import 'widgets/onboarding_dot_navigation.dart';
import 'widgets/onboarding_next_button.dart';
import 'widgets/onboarding_page.dart';
import 'widgets/onboarding_skip.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          // Horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  image: BImages.onBoardingImage1,
                  title: BTexts.onBoardingTitle1,
                  subTitle: BTexts.onBoardingSubTitle1),
              OnBoardingPage(
                  image: BImages.onBoardingImage2,
                  title: BTexts.onBoardingTitle2,
                  subTitle: BTexts.onBoardingSubTitle2),
              OnBoardingPage(
                  image: BImages.onBoardingImage3,
                  title: BTexts.onBoardingTitle3,
                  subTitle: BTexts.onBoardingSubTitle3),
            ],
          ),

          // Skip button
          const OnBoardingSkip(),

          // Dot navigation smooth page indicator
          const OnBoardingDotNavigation(),

          // circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
