import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class BLoaders {
  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: BHelperFunctions.isDarkMode(Get.context!)
                  ? BColors.darkGrey.withOpacity(0.9)
                  : BColors.grey.withOpacity(0.9)),
          child: Center(
            child: Text(message,
                style: Theme.of(Get.context!).textTheme.labelLarge),
          ),
        ),
      ),
    );
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: BColors.primary,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.check, color: BColors.white));
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: BColors.white));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: BColors.white));
  }
}
