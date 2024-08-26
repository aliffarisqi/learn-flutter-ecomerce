import 'package:alif_e_commerce/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/chip/choice_chip.dart';
import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widget/text/product_price.dart';
import '../../../../../common/widget/text/product_title.dart';
import '../../../../../common/widget/text/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../models/product_model.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = BHelperFunctions.isDarkMode(context);
    return Obx(
      () => Column(
        children: [
          /// Selected attribute and Description
          /// display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            BRoundedContainer(
              padding: const EdgeInsets.all(BSizes.md),
              backgroundColor: dark ? BColors.darkerGrey : BColors.grey,
              child: Column(
                children: [
                  // Title, Price and stock status
                  Row(
                    children: [
                      const BSectionHeading(title: "Variatoon", showActionButton: false),
                      const SizedBox(width: BSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProductTitle(title: 'Price :'),
                              const SizedBox(width: BSizes.spaceBtwItems / 2),
                              // Actual price
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  "\$${controller.getVariationPrice()}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(width: BSizes.spaceBtwItems / 2),

                              // Sale price
                              ProductPrice(price: controller.getVariationPrice())
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const ProductTitle(title: "Status :"),
                              const SizedBox(width: BSizes.spaceBtwItems / 2),
                              Text(controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleMedium)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Variation Description
                  const ProductTitle(
                    title: "This is description in variation lorem doal ipsun dolar",
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
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: BSizes.spaceBtwItems / 2),
                      BSectionHeading(title: attribute.name ?? "", showActionButton: false),
                      const SizedBox(height: BSizes.spaceBtwItems / 4),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                            final available = controller
                                .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return BChoiceChip(
                                text: attributeValue,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(product, attribute.name ?? "", attributeValue);
                                        }
                                      }
                                    : null);
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),

          ///

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     const BSectionHeading(title: "Size", showActionButton: false),
          //     const SizedBox(height: BSizes.spaceBtwItems / 2),
          //     Wrap(
          //       spacing: 8,
          //       children: [
          //         BChoiceChip(text: "M", selected: true, onSelected: (value) {}),
          //         BChoiceChip(text: "L", selected: false, onSelected: (value) {}),
          //         BChoiceChip(text: "XL", selected: false, onSelected: (value) {}),
          //       ],
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
