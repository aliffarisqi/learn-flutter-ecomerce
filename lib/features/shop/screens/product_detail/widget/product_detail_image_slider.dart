import 'package:alif_e_commerce/features/shop/controllers/product/image_controller.dart';
import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:alif_e_commerce/utils/helper/helper_functions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/appbar/appbar.dart';
import '../../../../../common/widget/custom_shapes/curved_edge/curved_edges_widget.dart';
import '../../../../../common/widget/icons/circular_icon.dart';
import '../../../../../common/widget/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class ProductImageSlider extends StatelessWidget {
  const ProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = BHelperFunctions.isDarkMode(context);

    final controller = Get.put(ImageController());
    final image = controller.getAllProductImage(product);
    return BCurvedEdgeWidget(
      child: Container(
        color: dark ? BColors.darkGrey : BColors.light,
        child: Stack(
          children: [
            /// MAIN LARGE IMAGE
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Padding(
                  padding: const EdgeInsets.all(BSizes.productImageRadius * 2),
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) => CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: BColors.primary,
                        ),
                      ),
                    );
                  })),
            ),

            /// IMAGE SLIDER
            Positioned(
              bottom: 30,
              right: 0,
              left: 0,
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: BSizes.spaceBtwItems * 1.5),
                  itemCount: image.length,
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: BSizes.spaceBtwItems,
                  ),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected = controller.selectedProductImage.value == image[index];
                    return BRoundedImage(
                      isNetworkImage: true,
                      width: 70,
                      imageUrl: image[index],
                      onPressed: () => controller.selectedProductImage.value = image[index],
                      backgroundColor: dark ? BColors.dark : BColors.white,
                      padding: const EdgeInsets.all(BSizes.sm),
                      border: Border.all(color: imageSelected ? BColors.primary : Colors.transparent),
                    );
                  }),
                ),
              ),
            ),

            /// APPBAR
            const BAppBar(
              showBackArrow: true,
              action: [
                BCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
