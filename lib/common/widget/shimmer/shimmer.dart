import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/helper/helper_functions.dart';

class BShimmerEffect extends StatelessWidget {
  const BShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: dark ? const Color.fromARGB(211, 43, 43, 43) : const Color.fromARGB(47, 199, 199, 199),
      highlightColor: dark ? const Color.fromARGB(255, 70, 70, 70) : const Color.fromARGB(159, 255, 255, 255),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? const Color.fromARGB(255, 129, 129, 129) : BColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
