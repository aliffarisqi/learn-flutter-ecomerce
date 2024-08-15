import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/shimmer/shimmer.dart';
import '../../../../../common/widget/product/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_string.dart';
import '../../../../personalization/controllers/user_controller.dart';
import '../../cart/cart.dart';

class BHomeAppBar extends StatelessWidget {
  const BHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
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
          Obx(() {
            if (controller.profileLoading.value) {
              //displayy shimer loading
              return const BShimmerEffect(width: 100, height: 15, radius: 5);
            }
            return Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: BColors.grey),
            );
          })
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
