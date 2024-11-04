import 'package:alif_e_commerce/common/widget/appbar/appbar.dart';
import 'package:alif_e_commerce/features/personalization/controllers/update_name_controller.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:alif_e_commerce/utils/constants/text_string.dart';
import 'package:alif_e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      //cutom appbar
      appBar: BAppBar(
        showBackArrow: true,
        title: Text("Change Name",
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(BSizes.defaultSpace),
        child: Column(
          children: [
            //heading
            Text(
              "the real name to easy verification, please use the real name to apear in several page",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: BSizes.spaceBtwItems),

            //text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        BValidator.validationEmptyText("First name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: BTexts.firstName,
                      prefix: Icon(Iconsax.user),
                    ),
                  ),
                  const SizedBox(height: BSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        BValidator.validationEmptyText("Last name", value),
                    expands: false,
                    decoration: const InputDecoration(
                      labelText: BTexts.lastName,
                      prefix: Icon(Iconsax.user),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: BSizes.spaceBtwItems),

            //save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => controller.updateUserName(),
                  child: const Text("Save")),
            )
          ],
        ),
      ),
    );
  }
}
