import 'package:alif_e_commerce/common/widget/loaders/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          color: backgroundColor ??
              (dark ? BColors.black : const Color.fromARGB(255, 240, 240, 240)),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
              color: const Color.fromARGB(255, 236, 236, 236), width: 2.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const BShimmerEffect(
                    width: 55,
                    height: 55,
                    radius: 55,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  fit: fit,
                  image: AssetImage(image),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
