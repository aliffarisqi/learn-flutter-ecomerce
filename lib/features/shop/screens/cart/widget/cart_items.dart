import 'package:flutter/material.dart';

import '../../../../../common/widget/product/cart/add_remove_button.dart';
import '../../../../../common/widget/product/cart/cart_item.dart';
import '../../../../../common/widget/text/product_price.dart';
import '../../../../../utils/constants/sizes.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButton = true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: BSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if (showAddRemoveButton) const SizedBox(height: BSizes.spaceBtwItems),
          if (showAddRemoveButton)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    //Extra Space
                    SizedBox(width: 70),
                    // ADD REMOVE BUTTON
                    BProductQuantityWithAddRemoveButton(),
                  ],
                ),
                ProductPrice(price: "250")
              ],
            )
        ],
      ),
    );
  }
}
