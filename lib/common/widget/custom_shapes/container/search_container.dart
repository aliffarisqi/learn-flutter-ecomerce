import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helper/helper_functions.dart';

class BSearchContainer extends StatelessWidget {
  const BSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = true,
      this.onTap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: BSizes.defaultSpace)});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: BDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.symmetric(
              horizontal: BSizes.md, vertical: BSizes.sm),
          decoration: BoxDecoration(
            color: showBackground
                ? dark
                    ? BColors.dark
                    : BColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(BSizes.borderRadiusLg),
            border: showBorder ? Border.all(color: BColors.grey) : null,
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.search_normal,
                color: BColors.darkerGrey,
              ),
              const SizedBox(width: BSizes.md),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
