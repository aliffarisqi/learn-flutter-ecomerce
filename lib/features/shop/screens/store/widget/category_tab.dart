import 'package:alif_e_commerce/common/widget/layout/grid_layout.dart';
import 'package:alif_e_commerce/common/widget/product/product_cards/vertical_cards.dart';
import 'package:alif_e_commerce/common/widget/text/section_heading.dart';
import 'package:alif_e_commerce/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widget/brands/brand_showcase.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), children: [
      Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: Column(
          children: [
            // BBrandShowCase()
            const BBrandShowCase(images: [BImages.productImage1, BImages.productImage2, BImages.productImage3]),

            /// PRODUCT
            BSectionHeading(title: 'You might like', showActionButton: true, onPressed: () {}),
            const SizedBox(height: BSizes.spaceBtwItems),
            GridLayout(itemCount: 15, itemBuilder: (_, index) => const ProductCardVertical())
          ],
        ),
      ),
    ]);
  }
}
