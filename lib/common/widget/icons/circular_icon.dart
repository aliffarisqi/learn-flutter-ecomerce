import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class BCircularIcon extends StatelessWidget {
  const BCircularIcon({
    super.key,
    required this.icon,
    this.width,
    this.height,
    this.size = BSizes.lg,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : dark
                ? BColors.black.withOpacity(0.9)
                : BColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        color: color,
        iconSize: size,
      ),
    );
  }
}
