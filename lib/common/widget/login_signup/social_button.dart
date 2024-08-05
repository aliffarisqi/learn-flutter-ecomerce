import 'package:alif_e_commerce/features/authentication/controller/login/login_controller.dart';
import 'package:alif_e_commerce/utils/constants/colors.dart';
import 'package:alif_e_commerce/utils/constants/images_strings.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BFooterForm extends StatelessWidget {
  const BFooterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: BColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () => controller.signInWithGoogle(),
            icon: const Image(
              width: BSizes.iconMd,
              height: BSizes.iconMd,
              image: AssetImage(BImages.google),
            ),
          ),
        ),
        const SizedBox(width: BSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: BColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: BSizes.iconMd,
              height: BSizes.iconMd,
              image: AssetImage(BImages.facebook),
            ),
          ),
        )
      ],
    );
  }
}
