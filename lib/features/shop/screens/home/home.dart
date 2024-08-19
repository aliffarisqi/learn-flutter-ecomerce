import 'package:alif_e_commerce/common/widget/layout/grid_layout.dart';
import 'package:alif_e_commerce/common/widget/product/product_cards/vertical_cards.dart';
import 'package:alif_e_commerce/features/shop/screens/all_product/all_product.dart';
import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/custom_shapes/container/primary_header_container.dart';
import '../../../../common/widget/custom_shapes/container/search_container.dart';
import '../../../../common/widget/text/section_heading.dart';
import 'widget/home_appbar.dart';
import 'widget/home_categories.dart';
import 'widget/promo_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const BPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Home App Bar
                  BHomeAppBar(),
                  SizedBox(height: BSizes.spaceBtwSections),

                  /// Search bar
                  BSearchContainer(text: "Search in store"),
                  SizedBox(height: BSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: BSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        BSectionHeading(
                          title: "Popular Categori",
                          showActionButton: false,
                          textColor: BColors.white,
                        ),
                        SizedBox(height: BSizes.spaceBtwItems),

                        /// Categories
                        BHomeCategories()
                      ],
                    ),
                  ),
                  SizedBox(height: BSizes.spaceBtwSections),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: BSizes.defaultSpace, vertical: BSizes.defaultSpace / 2),
              child: Column(
                children: [
                  // PROMO SLIDER
                  const PromoSlider(),
                  const SizedBox(height: BSizes.spaceBtwSections),

                  // SECTION HEADING
                  BSectionHeading(
                    title: "Popular Product",
                    onPressed: () => Get.to(() => const AllProductScreen()),
                  ),
                  const SizedBox(height: BSizes.spaceBtwItems),

                  // POPULAR PRODUCT
                  GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
