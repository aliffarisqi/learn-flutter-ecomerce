import 'package:alif_e_commerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:alif_e_commerce/common/widget/text/section_heading.dart';
import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/images_strings.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        BSectionHeading(
            title: "Payment Methode", textButton: "change", onPressed: () {}),
        const SizedBox(height: BSizes.spaceBtwItems / 2),
        Row(
          children: [
            BRoundedContainer(
              width: 60,
              height: 30,
              backgroundColor: dark ? BColors.light : BColors.white,
              padding: const EdgeInsets.all(BSizes.sm),
              child: const Image(
                image: AssetImage(BImages.paypal),
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: BSizes.spaceBtwItems / 2),
            Text("Paypal", style: Theme.of(context).textTheme.bodyLarge)
          ],
        )
      ],
    );
  }
}
