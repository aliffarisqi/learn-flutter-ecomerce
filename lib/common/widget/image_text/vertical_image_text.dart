import 'package:alif_e_commerce/common/widget/images/circular_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class BVerticalImageText extends StatelessWidget {
  const BVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.textColor = BColors.white,
    this.isNetworkImage = false,
    this.backgroundColor,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: BSizes.spaceBtwItems),
        child: Column(
          children: [
            CircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: BSizes.sm * 1.6,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: BHelperFunctions.isDarkMode(context)
                  ? BColors.light
                  : BColors.dark,
            ),

            ///Circular Icon
            // Container(
            //   height: 56,
            //   width: 56,
            //   padding: const EdgeInsets.all(BSizes.sm),
            //   decoration: BoxDecoration(
            //     color:
            //         backgroundColor ?? (dark ? BColors.black : BColors.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: dark ? BColors.white : BColors.dark,
            //     ),
            //   ),
            // ),

            /// Text
            const SizedBox(height: BSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
