import 'package:alif_e_commerce/features/shop/screens/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/product/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';

class BHomeAppBar extends StatelessWidget {
  const BHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            BTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: BColors.grey),
          ),
          Text(
            BTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: BColors.grey),
          )
        ],
      ),
      action: [
        BCartCounterIcon(
          onPressed: () => Get.to(() => const CartScreen()),
          iconColor: BColors.white,
        )
      ],
    );
  }
}
