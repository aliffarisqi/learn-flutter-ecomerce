import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/appbar/appbar.dart';
import '../../../../common/widget/brands/brand_card.dart';
import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/text/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import 'brands_product.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BAppBar(
        title: Text("Brands"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              const BSectionHeading(
                title: "All Brands",
                showActionButton: false,
              ),
              const SizedBox(height: BSizes.spaceBtwItems),

              /// Brands
              GridLayout(
                itemCount: 7,
                mainAxisExtent: 80,
                itemBuilder: (_, index) {
                  return BBrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => const BrandsProduct()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
