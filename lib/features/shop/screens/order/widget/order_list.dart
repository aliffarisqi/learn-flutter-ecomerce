import 'package:alif_e_commerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = BHelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: BSizes.spaceBtwItems),
      itemBuilder: (_, index) => BRoundedContainer(
        padding: const EdgeInsets.all(BSizes.md),
        showBorder: true,
        backgroundColor: dark ? BColors.dark : BColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Row 1
            Row(
              children: [
                // 1. Icon
                const Icon(Iconsax.truck_fast),
                const SizedBox(width: BSizes.spaceBtwItems / 2),

                // 2. Status Date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Processing",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: BColors.primary, fontSizeDelta: 1),
                      ),
                      Text("24 Oktober 2024",
                          style: Theme.of(context).textTheme.headlineSmall)
                    ],
                  ),
                ),

                //Icon Button
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: BSizes.iconSm,
                  ),
                )
              ],
            ),
            const SizedBox(height: BSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // 1. Icon
                      const Icon(Iconsax.tag),
                      const SizedBox(width: BSizes.spaceBtwItems / 2),

                      // 2. Status Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Order",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("QWFTB23",
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      // 1. Icon
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: BSizes.spaceBtwItems / 2),

                      // 2. Status Date
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Shipping Date",
                                style: Theme.of(context).textTheme.labelMedium),
                            Text("07 Nov 2024",
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                      ),
                    ],
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
