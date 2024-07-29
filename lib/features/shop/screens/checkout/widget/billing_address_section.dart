import 'package:flutter/material.dart';

import '../../../../../common/widget/text/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BSectionHeading(
          title: "Shipping Address",
          textButton: "change",
          onPressed: () {},
        ),
        Text("Bayu Alif F", style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: BSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, size: 16, color: Colors.grey),
            const SizedBox(width: BSizes.spaceBtwItems),
            Text("+6299823498234",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, size: 16, color: Colors.grey),
            const SizedBox(width: BSizes.spaceBtwItems),
            Text("JL.KH mas masyur, bekasi jaya",
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ],
    );
  }
}
