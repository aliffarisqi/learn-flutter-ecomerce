import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_cards/vertical_cards.dart';

class SortAbleProduct extends StatelessWidget {
  const SortAbleProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// DROPDOWN
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: ["Name", "Higher Price", "Lower Price", "Sale", "Newest", "Popularity"]
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: BSizes.spaceBtwSections),
        // PRODUCT
        GridLayout(
          itemCount: 7,
          itemBuilder: (_, index) => ProductCardVertical(product: ProductModel.empty()),
        )
      ],
    );
  }
}
