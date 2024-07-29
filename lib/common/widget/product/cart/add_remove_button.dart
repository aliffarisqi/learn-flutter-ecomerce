import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_functions.dart';
import '../../icons/circular_icon.dart';

class BProductQuantityWithAddRemoveButton extends StatelessWidget {
  const BProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        BCircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: BSizes.md,
          color: dark ? BColors.white : BColors.black,
          backgroundColor: dark ? BColors.black : BColors.light,
        ),
        const SizedBox(width: BSizes.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: BSizes.spaceBtwItems),
        const BCircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: BSizes.md,
          color: BColors.white,
          backgroundColor: BColors.primary,
        ),
      ],
    );
  }
}
