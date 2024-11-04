import 'package:alif_e_commerce/common/widget/shimmer/shimmer.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BCategoryShimmer extends StatelessWidget {
  const BCategoryShimmer({
    super.key,
    this.itemCount = 8,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => const SizedBox(
          width: BSizes.spaceBtwItems,
        ),
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              BShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: BSizes.spaceBtwItems / 2),
              BShimmerEffect(width: 55, height: 12),
            ],
          );
        },
      ),
    );
  }
}
