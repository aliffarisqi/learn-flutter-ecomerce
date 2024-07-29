import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/images_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';
import '../images/circular_image.dart';
import '../text/brand_title_text_verification.dart';

class BBrandCard extends StatelessWidget {
  const BBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: BRoundedContainer(
        padding: const EdgeInsets.symmetric(
            vertical: BSizes.sm, horizontal: BSizes.xs),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: CircularImage(
                isNetworkImage: false,
                image: BImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: dark ? BColors.white : BColors.black,
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwItems / 2),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BrandTitleTextVerification(
                    title: "title",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 Product",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
