import 'package:alif_e_commerce/common/widget/images/rounded_images.dart';
import 'package:alif_e_commerce/common/widget/product/product_cards/horizontal_card.dart';
import 'package:alif_e_commerce/common/widget/text/section_heading.dart';
import 'package:alif_e_commerce/utils/constants/images_strings.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(
        title: Text("Sports"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              ///Banner
              const BRoundedImage(
                imageUrl: BImages.promoBanner2,
                applyImageRadius: true,
                width: double.infinity,
              ),
              const SizedBox(height: BSizes.spaceBtwSections),

              // Sub categories
              BSectionHeading(title: "Sports shirts", onPressed: () {}),
              const SizedBox(height: BSizes.spaceBtwItems / 2),

              SizedBox(
                height: 120,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: BSizes.spaceBtwItems,
                  ),
                  itemBuilder: (context, index) =>
                      const ProductCardHorizontal(),
                ),
              ),
              const SizedBox(height: BSizes.spaceBtwSections / 2),
              BSectionHeading(title: "Football", onPressed: () {}),
              const SizedBox(height: BSizes.spaceBtwItems / 2),

              SizedBox(
                height: 120,
                child: ListView.separated(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: BSizes.spaceBtwItems,
                  ),
                  itemBuilder: (context, index) =>
                      const ProductCardHorizontal(),
                ),
              )

              //
            ],
          ),
        ),
      ),
    );
  }
}
