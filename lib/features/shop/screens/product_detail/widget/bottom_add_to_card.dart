import 'package:alif_e_commerce/common/widget/icons/circular_icon.dart';
import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomAddToCard extends StatelessWidget {
  const BottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.only(
        top: BSizes.defaultSpace,
        left: BSizes.defaultSpace / 2,
        right: BSizes.defaultSpace / 2,
        bottom: BSizes.defaultSpace * 1.5,
      ),
      decoration: BoxDecoration(
        color: dark ? BColors.darkerGrey : BColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(BSizes.cardRadiusLg),
          topRight: Radius.circular(BSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              BCircularIcon(
                icon: Iconsax.minus,
                backgroundColor: dark ? BColors.light : BColors.darkerGrey,
                width: 40,
                height: 40,
                color: dark ? Colors.black : Colors.white,
              ),
              const SizedBox(width: BSizes.spaceBtwItems),
              Text(
                "2",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(width: BSizes.spaceBtwItems),
              BCircularIcon(
                icon: Iconsax.add,
                backgroundColor: dark ? BColors.light : BColors.darkerGrey,
                width: 40,
                height: 40,
                color: dark ? Colors.black : Colors.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(BSizes.md),
              backgroundColor: BColors.primary,
              side: const BorderSide(color: BColors.black),
            ),
            child: const Text("Add To Cart"),
          )
        ],
      ),
    );
  }
}
