import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../images/rounded_images.dart';
import '../../text/brand_title_text_verification.dart';
import '../../text/product_title.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      children: [
        BRoundedImage(
          imageUrl: BImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(BSizes.sm),
          backgroundColor: dark ? BColors.darkerGrey : BColors.light,
        ),
        const SizedBox(width: BSizes.spaceBtwItems),
        //Title, Price and Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BrandTitleTextVerification(title: "Nike"),
              const Flexible(
                child: ProductTitle(title: "Nike Zoom Pegasus", maxLines: 1),
              ),

              /// Attribute
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Color ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "Green ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: "Size ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: "UK 80 ",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
