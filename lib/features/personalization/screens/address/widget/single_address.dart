import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return BRoundedContainer(
      padding: const EdgeInsets.all(BSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? BColors.primary.withOpacity(0.3)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : dark
              ? BColors.darkerGrey
              : BColors.grey,
      margin: const EdgeInsets.all(BSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 10,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? dark
                      ? BColors.light
                      : BColors.dark
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "John Doe",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: BSizes.sm / 2),
              const Text("+62-8523-2343-2334",
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              const SizedBox(height: BSizes.sm / 2),
              const Text(
                "resides at 123 Main Street, Apartment 4B, Springfield, IL 62704, United States. You can reach him at (555) 123-4567",
                softWrap: true,
              ),
            ],
          )
        ],
      ),
    );
  }
}
