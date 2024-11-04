import 'package:flutter/material.dart';

import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';
import '../../../../../common/widget/images/circular_image.dart';
import '../../../../../common/widget/text/brand_title_text_verification.dart';
import '../../../../../common/widget/text/product_price.dart';
import '../../../../../common/widget/text/product_title.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enum.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helper/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePrecentage(product.price, product.salePrice);
    final dark = BHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price and Sale Price
        Row(
          children: [
            // Sale Tag
            BRoundedContainer(
              radius: BSizes.sm,
              backgroundColor: BColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: BSizes.sm, vertical: BSizes.xs),
              child: Text(
                "$salePercentage%",
                style: Theme.of(context).textTheme.labelLarge!.apply(color: BColors.black),
              ),
            ),
            const SizedBox(width: BSizes.spaceBtwItems),

            // Price
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              Text(
                "${product.price}",
                style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() && product.salePrice > 0)
              const SizedBox(width: BSizes.spaceBtwItems),
            ProductPrice(price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 1.5),

        /// Title
        ProductTitle(title: product.title),
        const SizedBox(height: BSizes.spaceBtwItems / 1.5),

        /// Stock Status
        Row(
          children: [
            const ProductTitle(title: "Status"),
            const SizedBox(width: BSizes.spaceBtwItems),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            CircularImage(
              image: product.brand != null ? product.brand!.image : "",
              width: 42,
              height: 42,
              overlayColor: dark ? BColors.white : BColors.black,
            ),
            const SizedBox(width: BSizes.spaceBtwItems / 1.5),
            BrandTitleTextVerification(
              title: product.brand != null ? product.brand!.name : "",
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
        const SizedBox(height: BSizes.spaceBtwItems),
      ],
    );
  }
}
