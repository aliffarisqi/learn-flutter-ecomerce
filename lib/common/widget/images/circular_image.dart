import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helper/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
    required this.image,
    this.overlayColor,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.padding = BSizes.sm,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? (dark ? BColors.black : BColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) : AssetImage(image),
          color: overlayColor,
        ),
      ),
    );
  }
}
