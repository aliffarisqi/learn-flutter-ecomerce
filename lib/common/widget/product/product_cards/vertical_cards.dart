import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/screens/product_detail/product_detail.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../../styles/shadow_style.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_images.dart';
import '../../text/brand_title_text_verification.dart';
import '../../text/product_price.dart';
import '../../text/product_title.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetail()),
      child: Container(
        // width: 80,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [BShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(BSizes.productImageRadius),
            color: dark ? BColors.darkerGrey : BColors.white),
        child: Column(
          children: [
            // Thumbnail
            BRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(BSizes.sm),
              backgroundColor: dark ? BColors.dark : BColors.light,
              child: Stack(
                children: [
                  // Thumnail Image
                  const BRoundedImage(
                    imageUrl: BImages.productImage2,
                    applyImageRadius: true,
                  ),
                  // Sale Tag
                  Positioned(
                    top: 12,
                    child: BRoundedContainer(
                      radius: BSizes.sm,
                      backgroundColor: BColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: BSizes.sm, vertical: BSizes.xs),
                      child: Text(
                        "25%",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: BColors.black),
                      ),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: BCircularIcon(
                      icon: Iconsax.heart5,
                      color: BColors.error,
                    ),
                  )

                  // Favorite Tag
                ],
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwItems / 2),
            // Detail
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: BSizes.sm),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitle(
                    title: "Nike Zoom",
                    smalSize: true,
                  ),
                  SizedBox(height: BSizes.spaceBtwItems / 2),
                  BrandTitleTextVerification(title: "Zoom"),
                ],
              ),
            ),

            const Spacer(),
            // PRICE ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Price
                const Padding(
                  padding: EdgeInsets.only(left: BSizes.sm),
                  child: ProductPrice(
                    price: "45.5",
                    isLarge: true,
                  ),
                ),

                // Button Add
                Container(
                  decoration: const BoxDecoration(
                    color: BColors.dark,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(BSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(BSizes.productImageRadius)),
                  ),
                  child: const SizedBox(
                    width: BSizes.iconLg + 1.2,
                    height: BSizes.iconLg + 1.2,
                    child: Center(
                      child: Icon(
                        Iconsax.add,
                        color: BColors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
