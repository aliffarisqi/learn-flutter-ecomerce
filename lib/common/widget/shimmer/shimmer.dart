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
      baseColor: dark
          ? const Color.fromARGB(211, 43, 43, 43)
          : const Color.fromARGB(48, 222, 222, 222),
      highlightColor: dark
          ? const Color.fromARGB(255, 68, 68, 68)
          : const Color.fromARGB(159, 248, 248, 248),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ??
              (dark ? const Color.fromARGB(255, 129, 129, 129) : BColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
