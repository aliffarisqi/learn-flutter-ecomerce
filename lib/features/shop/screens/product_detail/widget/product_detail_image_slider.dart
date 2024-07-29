import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/custom_shapes/curved_edge/curved_edges_widget.dart';
import '../../../../../common/widget/icons/circular_icon.dart';
import '../../../../../common/widget/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return BCurvedEdgeWidget(
      child: Container(
        color: dark ? BColors.darkGrey : BColors.light,
        child: Stack(
          children: [
            /// MAIN LARGE IMAGE
            const SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(BSizes.productImageRadius * 2),
                child: Image(
                  image: AssetImage(BImages.productImage8),
                ),
              ),
            ),

            /// IMAGE SLIDER
            Positioned(
              bottom: 30,
              right: 0,
              left: BSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 7,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: BSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => BRoundedImage(
                    width: 80,
                    imageUrl: BImages.productImage8,
                    backgroundColor: dark ? BColors.dark : BColors.light,
                    border: Border.all(color: BColors.primary),
                    padding: const EdgeInsets.all(BSizes.sm),
                  ),
                ),
              ),
            ),

            /// APPBAR
            const BAppBar(
              showBackArrow: true,
              action: [
                BCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
