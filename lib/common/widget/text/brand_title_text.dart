import 'package:flutter/material.dart';

import '../../../utils/constants/enum.dart';

class BrandTitleText extends StatelessWidget {
  const BrandTitleText({
    super.key,
    this.color,
    required this.title,
    this.maxlines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });
  final Color? color;
  final String title;
  final int maxlines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,

      //check wich brand sized required
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSizes.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.titleLarge!.apply(color: color),
    );
  }
}
