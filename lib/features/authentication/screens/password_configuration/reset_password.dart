import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_string.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../login/login.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          )
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              // Image
              Image(
                image: const AssetImage(BImages.deliveredEmailIllustration),
                width: BHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(height: BSizes.spaceBtwSections),

              // Title and Subtitle
              Text(
                BTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BSizes.spaceBtwItems),

              Text(
                BTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BSizes.spaceBtwSections),

              // Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(() => const LoginScreen()),
                    child: const Text(BTexts.done)),
              ),
              const SizedBox(height: BSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(BTexts.resendEmail)),
              ),
            ],
          )),
    );
  }
}
