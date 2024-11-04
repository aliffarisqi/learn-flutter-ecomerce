import 'package:alif_e_commerce/common/widget/shimmer/shimmer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/custom_shapes/container/circular_container.dart';
import '../../../../../common/widget/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoading.value) return const BShimmerEffect(width: double.infinity, height: 190);
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) => controller.carouselCurrentIndex(index),
              ),
              items: controller.banners.map((banner) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: BSizes.spaceBtwItems / 3),
                  child: BRoundedImage(
                    imageUrl: banner.imageUrl,
                    isNetworkImage: true,
                    fit: BoxFit.cover,
                    onPressed: () => Get.toNamed(banner.targetScreen),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: BSizes.spaceBtwItems),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    BCircularContainer(
                      width: 20,
                      height: 5,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor: controller.carouselCurrentIndex.value == i ? BColors.primary : BColors.grey,
                    ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
