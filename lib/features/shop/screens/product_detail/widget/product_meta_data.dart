import 'package:alif_e_commerce/common/widget/images/circular_image.dart';
import 'package:alif_e_commerce/common/widget/text/brand_title_text_verification.dart';
import 'package:alif_e_commerce/common/widget/text/product_title.dart';
import 'package:alif_e_commerce/utils/constants/enum.dart';
import 'package:alif_e_commerce/utils/constants/images_strings.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widget/text/product_price.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale Price
        Row(
          children: [
            // Sale Tag
            BRoundedContainer(
              radius: BSizes.sm,
              backgroundColor: BColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: BSizes.sm, vertical: BSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: BColors.black),
              ),
            ),
            const SizedBox(width: BSizes.spaceBtwItems),

            // Price
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: BSizes.spaceBtwItems),
            const ProductPrice(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 1.5),

        /// Title
        const ProductTitle(title: "Nike Green Pegasus"),
        const SizedBox(height: BSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitle(title: "Status"),
            const SizedBox(width: BSizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              image: BImages.cosmeticsIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? BColors.white : BColors.black,
            ),
            const BrandTitleTextVerification(
              title: "Nike",
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
