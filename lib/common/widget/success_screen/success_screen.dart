import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_string.dart';
import '../../styles/spacing_style.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.onPressed,
  });

  final String title, subTitle, image;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: BSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              Lottie.asset(image,
                  width: MediaQuery.of(context).size.width * 0.8),
              const SizedBox(height: BSizes.spaceBtwSections),

              // Title and Subtitle
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BSizes.spaceBtwItems),

              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BSizes.spaceBtwItems),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onPressed, child: const Text(BTexts.tContinue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
