import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../custom_shapes/container/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_images.dart';
import '../../text/brand_title_text_verification.dart';
import '../../text/product_price.dart';
import '../../text/product_title.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Container(
      width: 300,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          // boxShadow: [BShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(BSizes.productImageRadius),
          color: dark ? BColors.darkerGrey : BColors.softGrey),
      child: Row(
        children: [
          //Thumbnail
          BRoundedContainer(
            height: 120,
            // margin: EdgeInsets.only(top: 4, left: 4, bottom: 4),
            padding: const EdgeInsets.all(BSizes.sm),
            backgroundColor: dark ? BColors.dark : BColors.white,
            child: Stack(
              children: [
                //Thumbnail Image
                const SizedBox(
                  height: 120,
                  width: 100,
                  child: BRoundedImage(
                    imageUrl: BImages.productImage1,
                    applyImageRadius: true,
                  ),
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
              ],
            ),
          ),

          //Details
          SizedBox(
            width: 182,
            child: Padding(
              padding: const EdgeInsets.only(top: BSizes.sm, left: BSizes.sm),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: BSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductTitle(
                            title: "Green nike half hbsjdh sdfhj ",
                            smalSize: true),
                        SizedBox(height: BSizes.spaceBtwItems / 2),
                        BrandTitleTextVerification(title: "Zoom"),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Pricing
                      const Flexible(
                        child: ProductPrice(price: "234.5 - 265.0sd"),
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
          )
        ],
      ),
    );
  }
}
