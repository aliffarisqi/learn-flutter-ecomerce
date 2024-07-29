import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$259.34", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 2),
        // Shipping fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$2.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 2),
        // Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$15.0.0", style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 2),
        // Total Order
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total", style: Theme.of(context).textTheme.bodyMedium),
            Text("\$245.0.0", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
