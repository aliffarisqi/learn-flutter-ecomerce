import 'package:alif_e_commerce/features/authentication/controller/signup/signup_controller.dart';
import 'package:alif_e_commerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_string.dart';
// import '../verify_email.dart';
import 'terms_and_confition.dart';

class BSignUpForm extends StatelessWidget {
  const BSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signUpFormKey,
      child: Column(
        children: [
          Row(
            children: [
              // Firstname
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      BValidator.validationEmptyText('First Name', value),
                  decoration: const InputDecoration(
                      labelText: BTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              //Lastname
              const SizedBox(width: BSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) =>
                      BValidator.validationEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                      labelText: BTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),

          //Username
          const SizedBox(height: BSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.username,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) =>
                BValidator.validationEmptyText('User Name', value),
            decoration: const InputDecoration(
                labelText: BTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),

          //Email
          const SizedBox(height: BSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.email,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => BValidator.validateEmail(value),
            decoration: const InputDecoration(
                labelText: BTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),

          //Phone number
          const SizedBox(height: BSizes.spaceBtwInputFields),
          TextFormField(
            controller: controller.phoneNumber,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => BValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
                labelText: BTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),

          //Password
          const SizedBox(height: BSizes.spaceBtwInputFields),
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => BValidator.validatePassword(value),
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

          //Terms and Condition
          const SizedBox(height: BSizes.spaceBtwInputFields),
          const BTermsAndCondition(),

          //Siign Up Button
          const SizedBox(height: BSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(BTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
