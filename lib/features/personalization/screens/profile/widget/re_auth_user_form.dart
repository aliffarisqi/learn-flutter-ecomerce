import 'package:alif_e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:alif_e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/text_string.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthUserForm extends StatelessWidget {
  const ReAuthUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController();
    return Scaffold(
      appBar: AppBar(title: const Text("Re-Auth User")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(BSizes.defaultSpace),
          child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  // email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value) => BValidator.validateEmail(value),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: BTexts.email,
                    ),
                  ),
                  const SizedBox(height: BSizes.spaceBtwInputFields),
                  //Password
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) =>
                          BValidator.validationEmptyText("Password", value),
                      decoration: InputDecoration(
                        labelText: BTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye)),
                      ),
                    ),
                  ),
                  const SizedBox(height: BSizes.spaceBtwItems),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticaitonUserPassword(),
                      child: const Text("Verify"),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
