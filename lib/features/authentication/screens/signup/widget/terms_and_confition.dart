import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controller/signup/signup_controller.dart';

class BTermsAndCondition extends StatelessWidget {
  const BTermsAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              checkColor: BColors.white,
              value: controller.privacyPolicy.value,
              onChanged: (value) {
                controller.privacyPolicy.value =
                    !controller.privacyPolicy.value;
              },
            ),
          ),
        ),
        const SizedBox(width: BSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: BTexts.iAgreeTo,
                  style: Theme.of(context).textTheme.bodyMedium),
              TextSpan(
                text: BTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: dark ? Colors.white : BColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? Colors.white : BColors.primary),
              ),
              TextSpan(
                  text: BTexts.and,
                  style: Theme.of(context).textTheme.bodyMedium),
              TextSpan(
                text: BTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                    color: dark ? Colors.white : BColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? Colors.white : BColors.primary),
              ),
            ],
          ),
        )
      ],
    );
  }
}
