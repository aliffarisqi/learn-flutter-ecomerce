import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';
import '../checkout/checkout.dart';
import 'widget/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        showBackArrow: true,
        title:
            Text("My Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
          padding: EdgeInsets.all(BSizes.defaultSpace), child: CartItems()),

      // CHECKOUT BUTTON
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text("Checkout \$1345.0")),
      ),
    );
  }
}
