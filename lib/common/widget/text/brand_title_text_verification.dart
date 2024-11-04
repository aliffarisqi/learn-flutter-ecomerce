import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enum.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title_text.dart';

class BrandTitleTextVerification extends StatelessWidget {
  const BrandTitleTextVerification({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textColor,
    this.iconColor = BColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: BrandTitleText(
            title: title,
            color: textColor,
            maxlines: maxlines,
            brandTextSize: brandTextSize,
            textAlign: textAlign,
          ),
        ),
        const SizedBox(width: BSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: BSizes.iconMd / 1.2,
        )
      ],
    );
  }
}
