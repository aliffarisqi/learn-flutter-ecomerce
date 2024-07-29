import 'package:alif_e_commerce/features/shop/controllers/home_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/custom_shapes/container/circular_container.dart';
import '../../../../../common/widget/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.carouselCurrentIndex(index),
          ),
          items: banners.map((url) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: BSizes.spaceBtwItems / 3),
              child: BRoundedImage(
                imageUrl: url,
                fit: BoxFit.cover,
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: BSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                BCircularContainer(
                  width: 20,
                  height: 5,
                  margin: const EdgeInsets.only(right: 10),
                  backgroundColor: controller.carouselCurrentIndex.value == i
                      ? BColors.primary
                      : BColors.grey,
                ),
            ],
          ),
        )
      ],
    );
  }
}
