import 'package:alif_e_commerce/common/widget/appbar/appbar.dart';
import 'package:alif_e_commerce/common/widget/icons/circular_icon.dart';
import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:alif_e_commerce/features/shop/screens/home/home.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widget/layout/grid_layout.dart';
import '../../../../common/widget/product/product_cards/vertical_cards.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BAppBar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          BCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(
              const HomeScreen(),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(
                itemCount: 15,
                itemBuilder: (_, index) => ProductCardVertical(product: ProductModel.empty()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
