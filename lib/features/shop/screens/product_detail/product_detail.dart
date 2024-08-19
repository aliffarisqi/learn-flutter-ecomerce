import 'package:alif_e_commerce/common/widget/text/section_heading.dart';
import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:alif_e_commerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/constants/sizes.dart';
import 'widget/bottom_add_to_card.dart';
import 'widget/product_attributes.dart';
import 'widget/product_detail_image_slider.dart';
import 'widget/product_meta_data.dart';
import 'widget/rating_share.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCard(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1. PRODUCT IMAGE SLIDER
            const ProductImageSlider(),

            /// 2. PRODUCT DETAIL
            Padding(
              padding: const EdgeInsets.only(
                left: BSizes.defaultSpace,
                right: BSizes.defaultSpace,
                bottom: BSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  ///-- Rating and Share button
                  const RatingAndShare(),

                  ///-- Price, title, stock, brand
                  const ProductMetaData(),

                  ///-- Attribute
                  const ProductAttributes(),
                  const SizedBox(height: BSizes.spaceBtwSections),

                  ///-- checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(height: BSizes.spaceBtwSections),

                  ///-- Description
                  const BSectionHeading(title: "Description", showActionButton: false),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  const ReadMoreText(
                    "These shoes offer superior comfort and support, perfect for athletes and casual wearers alike. Featuring breathable materials, durable construction, and a sleek aesthetic, Nike shoes provide excellent traction and stability for any activity. Whether you're hitting the gym, going for a run, or just stepping out for the day, Nike shoes deliver unmatched quality and timeless appeal, ensuring you look and feel your best.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: "See More",
                    trimExpandedText: "Less",
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: BSizes.spaceBtwSections),

                  ///-- Reviews
                  const Divider(),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BSectionHeading(title: "Review(1347)", showActionButton: false),
                      IconButton(
                        onPressed: () => Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3),
                        iconSize: 18,
                      )
                    ],
                  ),
                  const SizedBox(height: BSizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
