import 'package:alif_e_commerce/common/widget/layout/grid_layout.dart';
import 'package:alif_e_commerce/common/widget/shimmer/shimmer.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BVerticalProductShimmer extends StatelessWidget {
  const BVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
            BShimmerEffect(width: 180, height: 180),
            SizedBox(height: BSizes.spaceBtwItems),

            //Text
            BShimmerEffect(width: 160, height: 16),
            SizedBox(height: BSizes.spaceBtwItems / 2),
            BShimmerEffect(width: 110, height: 12),
          ],
        ),
      ),
    );
  }
}
