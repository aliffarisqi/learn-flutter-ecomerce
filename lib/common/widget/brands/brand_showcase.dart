import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';
import 'brand_card.dart';

class BBrandShowCase extends StatelessWidget {
  const BBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return BRoundedContainer(
      showBorder: true,
      borderColor: BColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(BSizes.sm),
      margin: const EdgeInsets.only(bottom: BSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with product count
          BBrandCard(
            showBorder: false,
            onTap: () {},
          ),
          const SizedBox(height: BSizes.spaceBtwItems / 2),

          /// BRAND WITH TOP 3 PRODUCT IMAGE
          Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList())
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Expanded(
      child: BRoundedContainer(
        height: 100,
        backgroundColor: dark ? BColors.darkGrey : BColors.light,
        margin: const EdgeInsets.symmetric(horizontal: BSizes.sm / 1.5),
        padding: const EdgeInsets.all(BSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
