import 'package:alif_e_commerce/features/shop/screens/sub_category/sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widget/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/images_strings.dart';

class BHomeCategories extends StatelessWidget {
  const BHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return BVerticalImageText(
              image: BImages.shoeIcon,
              title: "title",
              onTap: () => Get.to(() => const SubCategoriesScreen()),
            );
          }),
    );
  }
}
