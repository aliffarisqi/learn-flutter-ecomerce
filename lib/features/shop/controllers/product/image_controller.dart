import 'package:alif_e_commerce/features/shop/models/product_model.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get instance => Get.find();

  //variable
  RxString selectedProductImage = ''.obs;

  //get all image from product and variations
  List<String> getAllProductImage(ProductModel product) {
    //use set to add unique image only
    Set<String> images = {};

    //load thumbnail image
    images.add(product.thumbnail);

    //assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    //get all image from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //get all image from product variations if not null
    if (product.productVariations != null || product.productVariations!.isNotEmpty) {
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  //show image popup
  void showEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: BSizes.defaultSpace * 2, vertical: BSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: BSizes.spaceBtwItems),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(onPressed: () => Get.back(), child: const Text("Close")),
                    ),
                  )
                ],
              ),
            ));
  }
}
