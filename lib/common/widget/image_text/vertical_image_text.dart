import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class BVerticalImageText extends StatelessWidget {
  const BVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = BColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
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
            ///Circular Icon
            Container(
              height: 56,
              width: 56,
              padding: const EdgeInsets.all(BSizes.sm),
              decoration: BoxDecoration(
                color:
                    backgroundColor ?? (dark ? BColors.black : BColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                  color: dark ? BColors.white : BColors.dark,
                ),
              ),
            ),

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
