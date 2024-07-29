import 'package:alif_e_commerce/common/widget/appbar/appbar.dart';
import 'package:alif_e_commerce/common/widget/brands/brand_card.dart';
import 'package:alif_e_commerce/common/widget/product/sortable/sortable_product.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandsProduct extends StatelessWidget {
  const BrandsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BAppBar(
        title: Text("Nike"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              BBrandCard(showBorder: true),
              SizedBox(height: BSizes.spaceBtwSections),
              SortAbleProduct(),
            ],
          ),
        ),
      ),
    );
  }
}
