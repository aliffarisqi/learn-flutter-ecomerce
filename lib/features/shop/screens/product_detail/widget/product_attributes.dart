import 'package:alif_e_commerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:alif_e_commerce/common/widget/text/product_title.dart';
import 'package:alif_e_commerce/common/widget/text/section_heading.dart';
import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/chip/choice_chip.dart';
import '../../../../../common/widget/text/product_price.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Selected attribute and Description
        BRoundedContainer(
          padding: const EdgeInsets.all(BSizes.md),
          backgroundColor: dark ? BColors.darkerGrey : BColors.grey,
          child: Column(
            children: [
              // Title, Price and stock status
              Row(
                children: [
                  const BSectionHeading(
                      title: "Variatoon", showActionButton: false),
                  const SizedBox(width: BSizes.spaceBtwItems),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitle(title: 'Price :'),
                          const SizedBox(width: BSizes.spaceBtwItems / 2),
                          // Actual price
                          Text(
                            "\$25",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(width: BSizes.spaceBtwItems / 2),

                          // Sale price
                          const ProductPrice(price: "20")
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const ProductTitle(title: "Status :"),
                          const SizedBox(width: BSizes.spaceBtwItems / 2),
                          Text("In Stock",
                              style: Theme.of(context).textTheme.titleMedium)
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // Variation Description
              const ProductTitle(
                title:
                    "This is description in variation lorem doal ipsun dolar",
                smalSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(height: BSizes.spaceBtwItems),

        /// Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BSectionHeading(title: "Colors", showActionButton: false),
            const SizedBox(height: BSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                BChoiceChip(
                    text: "Green", selected: true, onSelected: (value) {}),
                BChoiceChip(
                    text: "Blue", selected: false, onSelected: (value) {}),
                BChoiceChip(
                    text: "Yellow", selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BSectionHeading(title: "Size", showActionButton: false),
            const SizedBox(height: BSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                BChoiceChip(text: "M", selected: true, onSelected: (value) {}),
                BChoiceChip(text: "L", selected: false, onSelected: (value) {}),
                BChoiceChip(
                    text: "XL", selected: false, onSelected: (value) {}),
              ],
            )
          ],
        )
      ],
    );
  }
}
